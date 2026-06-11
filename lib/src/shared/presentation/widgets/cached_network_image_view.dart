import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_art_galery/src/shared/config/app_environment.dart';
import 'package:web_art_galery/src/shared/config/cache/app_cache_manager.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

class CachedNetworkImageView extends StatelessWidget {
  const CachedNetworkImageView({
    super.key,
    required this.imagePathOrUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
    this.useImageKitEndpoint = true,
    this.openOriginalOnError = false,
    this.semanticLabel,
  });

  final String imagePathOrUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool useImageKitEndpoint;
  final bool openOriginalOnError;

  /// Accessibility label. Also surfaces in CanvasKit's a11y DOM overlay so
  /// crawlers that read the accessibility tree (Googlebot mobile) can index
  /// the image as having meaningful content.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final Widget image;
    if (_isAssetPath(imagePathOrUrl)) {
      image = Image.asset(
        imagePathOrUrl,
        width: width,
        height: height,
        fit: fit,
        semanticLabel: semanticLabel,
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Icon(Icons.broken_image_outlined)),
      );
    } else {
      final imageUrl = _resolveImageUrl(imagePathOrUrl);
      image = CachedNetworkImage(
        imageUrl: imageUrl,
        cacheManager: AppCacheManager(),
        width: width,
        height: height,
        fit: fit,
        progressIndicatorBuilder: (context, _, _) => const Center(child: AppLoader()),
        errorWidget: (context, url, error) {
          if (!openOriginalOnError) {
            return const Center(child: Icon(Icons.broken_image_outlined));
          }

          return Center(
            child: IconButton(
              onPressed: () => UrlLauncherUtils.launchUrlIfPossible(url: imageUrl),
              icon: const Icon(Icons.open_in_new),
              tooltip: 'Open image URL',
            ),
          );
        },
      );
    }

    final clipped = borderRadius == null
        ? image
        : ClipRRect(borderRadius: borderRadius!, child: image);

    final label = semanticLabel;
    if (label == null || label.isEmpty) return clipped;
    return Semantics(label: label, image: true, container: true, child: clipped);
  }

  // Bundled `assets/...` paths must be rendered with `Image.asset`, not
  // `CachedNetworkImage`, otherwise the network loader treats the relative path
  // as a URL and shows the broken-image fallback. Used by the About Author
  // fallback photos that ship in the bundle when Firebase is unreachable.
  static bool _isAssetPath(String raw) => raw.startsWith('assets/') || raw.startsWith('asset://');

  static String _resolveUrl(String raw, {required bool useImageKitEndpoint}) {
    final uri = Uri.tryParse(raw);
    final isAbsolute = uri != null && uri.hasScheme && uri.host.isNotEmpty;

    if (isAbsolute || !useImageKitEndpoint) {
      return raw;
    }

    return AppEnvironment.imagekitImageUrl(raw);
  }

  String _resolveImageUrl(String raw) => _resolveUrl(raw, useImageKitEndpoint: useImageKitEndpoint);

  /// Provider matching what this widget renders for [imagePathOrUrl], backed
  /// by the same [AppCacheManager] — lets callers `precacheImage` a photo so
  /// it is already decoded when the widget appears (e.g. before the
  /// onboarding tour highlights it).
  static ImageProvider providerFor(String imagePathOrUrl, {bool useImageKitEndpoint = true}) {
    if (_isAssetPath(imagePathOrUrl)) {
      return AssetImage(imagePathOrUrl);
    }
    return CachedNetworkImageProvider(
      _resolveUrl(imagePathOrUrl, useImageKitEndpoint: useImageKitEndpoint),
      cacheManager: AppCacheManager(),
    );
  }
}
