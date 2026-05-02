import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_art_galery/src/shared/config/app_environment.dart';
import 'package:web_art_galery/src/shared/config/cache/app_cache_manager.dart';
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
  });

  final String imagePathOrUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool useImageKitEndpoint;
  final bool openOriginalOnError;

  @override
  Widget build(BuildContext context) {
    final Widget image;
    if (_isAssetPath(imagePathOrUrl)) {
      image = Image.asset(
        imagePathOrUrl,
        width: width,
        height: height,
        fit: fit,
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
        progressIndicatorBuilder: (context, _, downloadProgress) =>
            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
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

    if (borderRadius == null) {
      return image;
    }

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }

  // Bundled `assets/...` paths must be rendered with `Image.asset`, not
  // `CachedNetworkImage`, otherwise the network loader treats the relative path
  // as a URL and shows the broken-image fallback. Used by the About Author
  // fallback photos that ship in the bundle when Firebase is unreachable.
  bool _isAssetPath(String raw) => raw.startsWith('assets/') || raw.startsWith('asset://');

  String _resolveImageUrl(String raw) {
    final uri = Uri.tryParse(raw);
    final isAbsolute = uri != null && uri.hasScheme && uri.host.isNotEmpty;

    if (isAbsolute || !useImageKitEndpoint) {
      return raw;
    }

    return AppEnvironment.imagekitImageUrl(raw);
  }
}
