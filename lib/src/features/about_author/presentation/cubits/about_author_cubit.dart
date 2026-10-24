import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/about_author/data/local/about_author_local_photos.dart';
import 'package:web_art_galery/src/features/about_author/domain/entities/author_photo.dart';
import 'package:web_art_galery/src/features/about_author/domain/repository/about_author_repository.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

@immutable
sealed class AboutAuthorState {
  const AboutAuthorState();
}

class AboutAuthorInitial extends AboutAuthorState {
  const AboutAuthorInitial();
}

class AboutAuthorLoading extends AboutAuthorState {
  const AboutAuthorLoading();
}

class AboutAuthorLoaded extends AboutAuthorState {
  const AboutAuthorLoaded({required this.photos});

  final List<AuthorPhoto> photos;

  AuthorPhoto? get firstPhoto => photos.isEmpty ? null : photos.first;

  AuthorPhoto? photoAt(int index) {
    if (index < 0 || index >= photos.length) return null;
    return photos[index];
  }
}

class AboutAuthorCubit extends Cubit<AboutAuthorState> {
  AboutAuthorCubit({required AboutAuthorRepository repository})
    : _repository = repository,
      super(const AboutAuthorInitial());

  final AboutAuthorRepository _repository;

  Future<void> loadPhotos() async {
    if (state is AboutAuthorLoaded) return;
    emit(const AboutAuthorLoading());
    try {
      final result = await _repository.fetchPhotos();
      final filled = AboutAuthorLocalPhotos.fallbackCount(result.photos);
      if (filled > 0) {
        _logPhotosFallback(reason: 'firestore_missing', filled: filled);
      }
      emit(AboutAuthorLoaded(photos: AboutAuthorLocalPhotos.withFallbacks(result.photos)));
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'About author photos fetch failed',
        error: error,
        stackTrace: stackTrace,
      );
      AppTelemetry.instance.logFirebaseError(
        error,
        stackTrace,
        reason: 'about_author_photos_fetch',
      );
      // Firestore unreachable — show the bundled copies instead of empty frames.
      _logPhotosFallback(
        reason: 'firestore_error',
        filled: AboutAuthorLocalPhotos.fallbackCount(const []),
      );
      emit(AboutAuthorLoaded(photos: AboutAuthorLocalPhotos.withFallbacks(const [])));
    }
  }

  /// Photo list (partly) served from the bundled copies instead of Firestore.
  void _logPhotosFallback({required String reason, required int filled}) {
    AppTelemetry.instance.logEvent(
      'about_author_photos_fallback',
      params: {'reason': reason, 'filled': filled},
    );
  }
}
