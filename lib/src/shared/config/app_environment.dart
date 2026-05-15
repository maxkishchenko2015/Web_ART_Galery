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
    final transforms = width != null && width > 0
        ? '$_defaultTransforms,w-$width'
        : _defaultTransforms;
    return '$endpoint/$normalizedPath?tr=$transforms';
  }
}
