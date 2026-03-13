class AppEnvironment {
  const AppEnvironment._();

  /// Example: https://ik.imagekit.io/your_imagekit_id
  static const String imagekitUrlEndpoint = String.fromEnvironment(
    'IMAGEKIT_URL_ENDPOINT',
    defaultValue: '',
  );

  static bool get hasImagekitEndpoint => imagekitUrlEndpoint.isNotEmpty;

  /// Builds an absolute ImageKit URL from relative path.
  static String imagekitImageUrl(String path) {
    final normalizedPath = path.startsWith('/') ? path.substring(1) : path;

    if (!hasImagekitEndpoint) {
      return normalizedPath;
    }

    return '${imagekitUrlEndpoint.replaceAll(RegExp(r'/$'), '')}/$normalizedPath';
  }
}
