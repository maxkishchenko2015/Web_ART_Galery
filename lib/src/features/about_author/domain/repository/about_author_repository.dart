import 'package:web_art_galery/src/features/about_author/domain/entities/author_photo.dart';

/// Aggregated result returned by [AboutAuthorRepository.fetchPhotos].
class AboutAuthorPhotos {
  const AboutAuthorPhotos({required this.photos});

  final List<AuthorPhoto> photos;

  bool get isEmpty => photos.isEmpty;

  AuthorPhoto? get firstOrNull => photos.isEmpty ? null : photos.first;
}

abstract class AboutAuthorRepository {
  /// Fetches all photos configured for the "About the Author" page.
  ///
  /// Photos are returned in the same order as they appear in Firestore,
  /// so callers can rely on the first element being the hero image.
  Future<AboutAuthorPhotos> fetchPhotos();
}
