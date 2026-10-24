import 'dart:math' as math;

import 'package:web_art_galery/src/features/about_author/domain/entities/author_photo.dart';

/// Bundled copies of the about-author photos, in the same order as the
/// Firestore `AboutAuthor.items` array: hero portrait, "Universal Realism",
/// "Tapestry of the Century", "Chernobyl", mosaics.
///
/// Shown when Firestore can't deliver the photo list or ImageKit can't deliver
/// a photo (e.g. `ClientException` on a flaky network), so the page never
/// renders empty frames.
abstract final class AboutAuthorLocalPhotos {
  const AboutAuthorLocalPhotos._();

  static const List<String> assetPaths = [
    'assets/images/about_author/1_hero.jpg',
    'assets/images/about_author/2_universal_realism.jpg',
    'assets/images/about_author/3_tapestry_of_the_century.jpg',
    'assets/images/about_author/4_chernobyl.jpg',
    'assets/images/about_author/5_mosaic.jpg',
  ];

  /// Bundled copy for the photo at [index], or null when there is none.
  static String? assetAt(int index) =>
      index >= 0 && index < assetPaths.length ? assetPaths[index] : null;

  /// How many slots of [remote] [withFallbacks] fills with a bundled copy.
  static int fallbackCount(List<AuthorPhoto> remote) => [
    for (var i = 0; i < assetPaths.length; i++)
      if (i >= remote.length || remote[i].isEmpty) i,
  ].length;

  /// [remote] with every missing or empty slot filled by its bundled copy.
  static List<AuthorPhoto> withFallbacks(List<AuthorPhoto> remote) {
    final length = math.max(remote.length, assetPaths.length);
    return [
      for (var i = 0; i < length; i++)
        if (i < remote.length && !remote[i].isEmpty)
          remote[i]
        else
          AuthorPhoto(url: assetAt(i) ?? ''),
    ];
  }
}
