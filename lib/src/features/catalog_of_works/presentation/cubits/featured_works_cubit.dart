import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/repository/catalog_of_works_repository.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

@immutable
sealed class FeaturedWorksState {
  const FeaturedWorksState();
}

class FeaturedWorksInitial extends FeaturedWorksState {
  const FeaturedWorksInitial();
}

class FeaturedWorksLoading extends FeaturedWorksState {
  const FeaturedWorksLoading();
}

class FeaturedWorksLoaded extends FeaturedWorksState {
  const FeaturedWorksLoaded({required this.paintings});

  /// Sorted by `pictureId`.
  final List<Painting> paintings;
}

class FeaturedWorksError extends FeaturedWorksState {
  const FeaturedWorksError(this.message);

  final String message;
}

/// Loads the hand-picked paintings shown in the home page's "Selected works"
/// section (ids from Remote Config `MAIN_PICTURES_IDS` or its fallback).
/// Picked by `pictureId` (not by title) and sorted by it, so the selection
/// and its order stay the same in every language.
class FeaturedWorksCubit extends Cubit<FeaturedWorksState> {
  FeaturedWorksCubit({required CatalogOfWorksRepository repository})
    : _repository = repository,
      super(const FeaturedWorksInitial());

  final CatalogOfWorksRepository _repository;

  /// Ids of the selection currently loaded / loading.
  List<String>? _ids;

  /// Loads [pictureIds]; a no-op when that same selection is already loaded
  /// or loading, a reload when the selection changed (e.g. Remote Config
  /// replaced the fallback ids).
  Future<void> load(List<String> pictureIds) async {
    final ids = [...pictureIds]..sort();
    if (listEquals(ids, _ids) && state is! FeaturedWorksError) return;
    _ids = ids;
    emit(const FeaturedWorksLoading());
    try {
      final paintings = await _repository.fetchPaintingsByIds(ids);
      if (!listEquals(ids, _ids)) return; // superseded by a newer selection
      final displayable = paintings
          .where((p) => p.imageUrl.trim().isNotEmpty)
          .toList(growable: false);
      emit(FeaturedWorksLoaded(paintings: displayable));
    } catch (error, stackTrace) {
      AppLogger.instance.e('Featured works fetch failed', error: error, stackTrace: stackTrace);
      AppTelemetry.instance.logFirebaseError(error, stackTrace, reason: 'featured_works_fetch');
      emit(FeaturedWorksError(error.toString()));
    }
  }
}
