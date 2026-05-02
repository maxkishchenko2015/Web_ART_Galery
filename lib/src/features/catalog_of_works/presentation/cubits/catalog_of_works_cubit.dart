import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/repository/catalog_of_works_repository.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Decade buckets exposed in the catalog filter chip bar.
///
/// Paintings outside the listed ranges (e.g. 1958, 1959) are intentionally
/// only visible under the `null`/All filter; the product spec asks for the
/// 60s through 90s buckets only.
enum Decade {
  sixties(1960, 1969),
  seventies(1970, 1979),
  eighties(1980, 1989),
  nineties(1990, 1999);

  const Decade(this.startYear, this.endYearInclusive);

  final int startYear;
  final int endYearInclusive;

  bool contains(int year) => year >= startYear && year <= endYearInclusive;
}

@immutable
sealed class CatalogOfWorksState {
  const CatalogOfWorksState();
}

class CatalogOfWorksInitial extends CatalogOfWorksState {
  const CatalogOfWorksInitial();
}

class CatalogOfWorksLoading extends CatalogOfWorksState {
  const CatalogOfWorksLoading();
}

class CatalogOfWorksLoaded extends CatalogOfWorksState {
  const CatalogOfWorksLoaded({
    required this.paintings,
    required this.page,
    required this.hasReachedMax,
    required this.isLoadingMore,
    this.selectedDecade,
  });

  final List<Painting> paintings;
  final int page;
  final bool hasReachedMax;
  final bool isLoadingMore;

  /// Currently active decade filter. `null` means "All" — every loaded
  /// painting is visible.
  final Decade? selectedDecade;

  /// Subset of [paintings] that should be rendered for the current
  /// [selectedDecade]. Computed on access to keep the source list
  /// untouched (so toggling filters never re-fetches).
  List<Painting> get visiblePaintings {
    final decade = selectedDecade;
    if (decade == null) return paintings;
    return paintings
        .where((p) => decade.contains(p.yearOfCreation))
        .toList(growable: false);
  }

  CatalogOfWorksLoaded copyWith({
    List<Painting>? paintings,
    int? page,
    bool? hasReachedMax,
    bool? isLoadingMore,
    Object? selectedDecade = _sentinel,
  }) {
    return CatalogOfWorksLoaded(
      paintings: paintings ?? this.paintings,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      selectedDecade: identical(selectedDecade, _sentinel)
          ? this.selectedDecade
          : selectedDecade as Decade?,
    );
  }
}

/// Marker used by [CatalogOfWorksLoaded.copyWith] to differentiate
/// "leave [selectedDecade] unchanged" from "explicitly clear it to null".
const Object _sentinel = Object();

class CatalogOfWorksError extends CatalogOfWorksState {
  const CatalogOfWorksError(this.message);

  final String message;
}

class CatalogOfWorksCubit extends Cubit<CatalogOfWorksState> {
  CatalogOfWorksCubit({required CatalogOfWorksRepository repository})
    : _repository = repository,
      super(const CatalogOfWorksInitial());

  static const int _pageSize = 20;

  /// Auto-loader stops once we have at least this many paintings matching
  /// the active filter, to avoid blowing through every page when only a
  /// handful of items are needed to fill the grid.
  static const int _autoLoadVisibleTarget = 12;

  final CatalogOfWorksRepository _repository;

  /// Monotonic token incremented on every filter change. Long-running
  /// auto-load loops compare the captured token against [_autoLoadToken]
  /// before each `loadMore` call so a stale loop short-circuits as soon
  /// as the user picks a different decade.
  int _autoLoadToken = 0;

  Future<void> loadInitial() async {
    if (state is CatalogOfWorksLoaded) return;
    emit(const CatalogOfWorksLoading());
    await _fetchPage(page: 1, reset: true);
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! CatalogOfWorksLoaded) return;
    if (current.isLoadingMore || current.hasReachedMax) return;

    emit(current.copyWith(isLoadingMore: true));
    await _fetchPage(page: current.page + 1, reset: false);
  }

  /// Switches the active decade filter (`null` for "All"). When a real
  /// decade is selected, kicks off [_autoLoadForFilter] in the background
  /// so the grid fills in even if the early pages are dominated by other
  /// decades. Switching filters cancels any in-flight auto-load loop via
  /// [_autoLoadToken].
  void selectDecade(Decade? decade) {
    final current = state;
    if (current is! CatalogOfWorksLoaded) return;
    if (current.selectedDecade == decade) return;

    _autoLoadToken += 1;
    emit(current.copyWith(selectedDecade: decade));

    if (decade != null) {
      // Fire-and-forget; the loop is internally guarded against state
      // races and token invalidation, so callers don't need to await.
      // ignore: discarded_futures
      _autoLoadForFilter(_autoLoadToken);
    }
  }

  /// Background loop that keeps paginating until either:
  ///   * the catalog has [_autoLoadVisibleTarget] visible paintings for
  ///     the active filter,
  ///   * the repository signals `hasReachedMax`, or
  ///   * the user picks a different decade (token mismatch).
  Future<void> _autoLoadForFilter(int token) async {
    while (token == _autoLoadToken) {
      final current = state;
      if (current is! CatalogOfWorksLoaded) return;
      if (current.hasReachedMax) return;
      if (current.visiblePaintings.length >= _autoLoadVisibleTarget) return;
      if (current.isLoadingMore) {
        // Yield until the in-flight page settles, then re-evaluate.
        await Future<void>.delayed(const Duration(milliseconds: 50));
        continue;
      }
      await loadMore();
    }
  }

  Future<void> _fetchPage({required int page, required bool reset}) async {
    final previous = state;
    try {
      final result = await _repository.fetchPaintingsPage(page: page, pageSize: _pageSize);

      final existing = !reset && previous is CatalogOfWorksLoaded
          ? previous.paintings
          : const <Painting>[];
      final preservedDecade = previous is CatalogOfWorksLoaded
          ? previous.selectedDecade
          : null;

      final merged = <Painting>[...existing, ..._filterDisplayable(result.items)];

      if (reset && merged.isEmpty && result.hasReachedMax) {
        AppTelemetry.instance.logEmptyContent(source: 'catalog_paintings');
      }

      emit(
        CatalogOfWorksLoaded(
          paintings: merged,
          page: result.page,
          hasReachedMax: result.hasReachedMax,
          isLoadingMore: false,
          selectedDecade: preservedDecade,
        ),
      );
    } catch (error, stackTrace) {
      AppLogger.instance.e('Catalog page fetch failed', error: error, stackTrace: stackTrace);
      AppTelemetry.instance.logFirebaseError(error, stackTrace, reason: 'catalog_fetch_page');
      if (!reset && previous is CatalogOfWorksLoaded) {
        emit(previous.copyWith(isLoadingMore: false));
        return;
      }
      emit(CatalogOfWorksError(error.toString()));
    }
  }

  /// Drops paintings that have no usable image URL. Rendering an empty card
  /// for such records is a worse UX than simply omitting them, so the state
  /// only ever exposes entries the catalog grid can actually display.
  Iterable<Painting> _filterDisplayable(Iterable<Painting> items) {
    return items.where((p) => p.imageUrl.trim().isNotEmpty);
  }
}
