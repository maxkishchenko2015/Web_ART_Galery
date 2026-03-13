import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/repository/catalog_of_works_repository.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

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
  });

  final List<Painting> paintings;
  final int page;
  final bool hasReachedMax;
  final bool isLoadingMore;

  CatalogOfWorksLoaded copyWith({
    List<Painting>? paintings,
    int? page,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return CatalogOfWorksLoaded(
      paintings: paintings ?? this.paintings,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class CatalogOfWorksError extends CatalogOfWorksState {
  const CatalogOfWorksError(this.message);

  final String message;
}

class CatalogOfWorksCubit extends Cubit<CatalogOfWorksState> {
  CatalogOfWorksCubit({required CatalogOfWorksRepository repository})
    : _repository = repository,
      super(const CatalogOfWorksInitial());

  static const int _pageSize = 20;

  final CatalogOfWorksRepository _repository;

  Future<void> loadInitial() async {
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

  Future<void> _fetchPage({required int page, required bool reset}) async {
    final previous = state;
    try {
      final result = await _repository.fetchPaintingsPage(page: page, pageSize: _pageSize);

      final existing = !reset && previous is CatalogOfWorksLoaded
          ? previous.paintings
          : const <Painting>[];

      emit(
        CatalogOfWorksLoaded(
          paintings: <Painting>[...existing, ...result.items],
          page: result.page,
          hasReachedMax: result.hasReachedMax,
          isLoadingMore: false,
        ),
      );
    } catch (error, stackTrace) {
      AppLogger.instance.e('Catalog page fetch failed', error: error, stackTrace: stackTrace);
      if (!reset && previous is CatalogOfWorksLoaded) {
        emit(previous.copyWith(isLoadingMore: false));
        return;
      }
      emit(CatalogOfWorksError(error.toString()));
    }
  }
}
