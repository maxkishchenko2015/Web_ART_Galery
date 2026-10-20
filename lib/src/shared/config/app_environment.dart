class AppEnvironment {
  const AppEnvironment._();

  /// Example: https://ik.imagekit.io/your_imagekit_id
  static const String imagekitUrlEndpoint = String.fromEnvironment(
    'IMAGEKIT_URL_ENDPOINT',
    defaultValue: '',
  );

  static bool get hasImagekitEndpoint => imagekitUrlEndpoint.isNotEmpty;

  /// Default ImageKit transformation chain applied to every served image:
  ///
  ///   - `f-auto` — auto-negotiate the best supported format per request
  ///     (AVIF on modern Chrome/Edge, WebP on Safari/Firefox, JPEG/PNG
  ///     fallback). This alone typically cuts payload by 30–50 %.
  ///   - `q-80`   — 80 % quality. Visually lossless for paintings while
  ///     keeping bytes low.
  static const String _defaultTransforms = 'f-auto,q-80';

  /// Builds an absolute ImageKit URL from a relative storage path.
  /// Adds the default `tr=f-auto,q-80` chain so browsers receive WebP/AVIF
  /// when supported. Pass [width] to also clamp the largest rendered side,
  /// e.g. `imagekitImageUrl('img.jpg', width: 720)` adds `w-720`.
  static String imagekitImageUrl(String path, {int? width}) {
    final normalizedPath = path.startsWith('/') ? path.substring(1) : path;

    if (!hasImagekitEndpoint) {
      return normalizedPath;
    }

    final endpoint = imagekitUrlEndpoint.replaceAll(RegExp(r'/$'), '');
    return '$endpoint/$normalizedPath?tr=${_transforms(width)}';
  }

  /// Widths requested from ImageKit. Snapping to a few fixed sizes keeps the
  /// number of distinct URLs — and so ImageKit / browser cache entries — small.
  static const List<int> _imageWidthBuckets = [320, 480, 640, 800, 1080, 1280, 1600, 2048];

  /// Smallest bucket that covers [physicalWidth], capped at the largest one.
  static int imageWidthBucket(double physicalWidth) {
    for (final bucket in _imageWidthBuckets) {
      if (bucket >= physicalWidth) {
        return bucket;
      }
    }
    return _imageWidthBuckets.last;
  }

  /// Adds the default transform chain plus `w-[width]` to an absolute ImageKit
  /// URL — the form Firestore stores (`https://ik.imagekit.io/<id>/<file>`,
  /// sometimes with `?updatedAt=`). Other hosts and URLs that already carry a
  /// transformation are returned unchanged.
  static String imagekitSizedUrl(String url, {required int width}) {
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.host.endsWith('imagekit.io')) {
      return url;
    }
    if (uri.queryParameters.containsKey('tr') || uri.path.contains('/tr:')) {
      return url;
    }
    // Appended by hand so the existing path / query encoding stays untouched.
    final separator = uri.hasQuery ? '&' : '?';
    return '$url${separator}tr=${_transforms(width)}';
  }

  /// `c-at_max` caps the width without upscaling smaller originals.
  static String _transforms(int? width) =>
      width != null && width > 0 ? '$_defaultTransforms,w-$width,c-at_max' : _defaultTransforms;
}
