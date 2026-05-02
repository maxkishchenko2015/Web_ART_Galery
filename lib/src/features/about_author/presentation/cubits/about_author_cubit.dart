import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class AboutAuthorError extends AboutAuthorState {
  const AboutAuthorError(this.message);

  final String message;
}

class AboutAuthorCubit extends Cubit<AboutAuthorState> {
  AboutAuthorCubit({required AboutAuthorRepository repository})
    : _repository = repository,
      super(const AboutAuthorInitial());

  final AboutAuthorRepository _repository;

  // About-Author always renders five photo slots (hero, universal realism,
  // tapestry, chernobyl, mosaic). When Firebase is unreachable we fall back to
  // these bundled assets so the page never shows an error state.
  // Indexes intentionally match AboutAuthorPageConstants.*PhotoIndex so the
  // existing rendering code keeps working without further changes.
  static const List<AuthorPhoto> _fallbackPhotos = <AuthorPhoto>[
    AuthorPhoto(url: 'assets/images/about_author_fallback/01.png'),
    AuthorPhoto(url: 'assets/images/about_author_fallback/02.png'),
    AuthorPhoto(url: 'assets/images/about_author_fallback/03.png'),
    AuthorPhoto(url: 'assets/images/about_author_fallback/04.png'),
    AuthorPhoto(url: 'assets/images/about_author_fallback/05.png'),
  ];

  Future<void> loadPhotos() async {
    if (state is AboutAuthorLoaded) return;
    emit(const AboutAuthorLoading());
    try {
      final result = await _repository.fetchPhotos();
      if (result.isEmpty) {
        emit(const AboutAuthorLoaded(photos: _fallbackPhotos));
        return;
      }
      emit(AboutAuthorLoaded(photos: result.photos));
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'About author photos fetch failed — using bundled fallback',
        error: error,
        stackTrace: stackTrace,
      );
      AppTelemetry.instance.logFirebaseError(
        error,
        stackTrace,
        reason: 'about_author_photos_fetch',
      );
      emit(const AboutAuthorLoaded(photos: _fallbackPhotos));
    }
  }
}
