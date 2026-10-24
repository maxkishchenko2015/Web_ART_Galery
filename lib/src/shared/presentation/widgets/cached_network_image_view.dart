import 'package:material_ui/material_ui.dart';
import 'package:web_art_galery/src/shared/config/app_environment.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/network_image/app_network_image_provider.dart';
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
    this.resizeToLayout = true,
    this.fallbackAssetPath,
    this.onFallbackShown,
    this.semanticLabel,
  });

  final String imagePathOrUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool useImageKitEndpoint;
  final bool openOriginalOnError;

  /// Requests an ImageKit rendition sized to the laid-out width instead of the
  /// full-resolution original, so the browser downloads and decodes only the
  /// pixels it shows. Turn off where the user can zoom past the layout size
  /// (fullscreen viewer).
  final bool resizeToLayout;

  /// Bundled image shown instead of the broken-image icon when the network
  /// image fails (e.g. ImageKit unreachable). Takes precedence over
  /// [openOriginalOnError].
  final String? fallbackAssetPath;

  /// Called with the network error whenever [fallbackAssetPath] is shown
  /// instead of the network image. Runs on every rebuild of the error state,
  /// so callers that log it should de-duplicate.
  final ValueChanged<Object>? onFallbackShown;

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
    } else if (!resizeToLayout) {
      image = _buildNetworkImage(requestWidth: null);
    } else {
      image = LayoutBuilder(
        builder: (context, constraints) {
          final layoutWidth = constraints.maxWidth.isFinite ? constraints.maxWidth : width;
          final requestWidth = layoutWidth != null && layoutWidth.isFinite
              ? requestWidthFor(
                  layoutWidth,
                  fit: fit,
                  devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
                )
              : null;
          return _buildNetworkImage(requestWidth: requestWidth);
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

  Widget _buildNetworkImage({required int? requestWidth}) {
    return Image(
      // Pixel-owning web decode — see AppNetworkImageProvider.
      image: AppNetworkImageProvider(
        _resolveUrl(
          imagePathOrUrl,
          useImageKitEndpoint: useImageKitEndpoint,
          requestWidth: requestWidth,
        ),
      ),
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, _) =>
          frame == null ? const Center(child: AppLoader()) : child,
      errorBuilder: (context, error, stackTrace) {
        final fallback = fallbackAssetPath;
        if (fallback != null) {
          onFallbackShown?.call(error);
          return Image.asset(
            fallback,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, _, _) => const Center(child: Icon(Icons.broken_image_outlined)),
          );
        }
        if (!openOriginalOnError) {
          return const Center(child: Icon(Icons.broken_image_outlined));
        }

        final originalUrl = _resolveUrl(imagePathOrUrl, useImageKitEndpoint: useImageKitEndpoint);
        return Center(
          child: IconButton(
            onPressed: () => UrlLauncherUtils.launchUrlIfPossible(url: originalUrl),
            icon: const Icon(Icons.open_in_new),
            tooltip: 'Open image URL',
          ),
        );
      },
    );
  }

  /// Physical pixel width to request for an image laid out [logicalWidth]
  /// wide. `cover` gets headroom because a cropped image is scaled up until it
  /// also fills the box's other side.
  static int requestWidthFor(
    double logicalWidth, {
    required BoxFit fit,
    required double devicePixelRatio,
  }) {
    final coverHeadroom = fit == BoxFit.cover ? 1.5 : 1.0;
    return AppEnvironment.imageWidthBucket(logicalWidth * devicePixelRatio * coverHeadroom);
  }

  // Bundled `assets/...` paths must be rendered with `Image.asset`, not the
  // network provider, otherwise the network loader treats the relative path
  // as a URL and shows the broken-image fallback.
  static bool _isAssetPath(String raw) => raw.startsWith('assets/') || raw.startsWith('asset://');

  /// Sized to [requestWidth] when given: absolute ImageKit URLs (what Firestore
  /// stores) get a `tr=…,w-` query, relative storage paths go through the
  /// configured endpoint. Other absolute hosts are returned as-is.
  static String _resolveUrl(
    String raw, {
    required bool useImageKitEndpoint,
    int? requestWidth,
  }) {
    final uri = Uri.tryParse(raw);
    final isAbsolute = uri != null && uri.hasScheme && uri.host.isNotEmpty;

    if (isAbsolute) {
      return requestWidth == null
          ? raw
          : AppEnvironment.imagekitSizedUrl(raw, width: requestWidth);
    }
    if (!useImageKitEndpoint) {
      return raw;
    }

    return AppEnvironment.imagekitImageUrl(raw, width: requestWidth);
  }

  /// Provider matching what this widget renders for [imagePathOrUrl] — lets
  /// callers `precacheImage` a photo so it is already decoded when the widget
  /// appears (e.g. before the onboarding tour highlights it). Pass the same
  /// [requestWidth] the widget computes (see [requestWidthFor]) so both hit
  /// one cached URL.
  static ImageProvider providerFor(
    String imagePathOrUrl, {
    bool useImageKitEndpoint = true,
    int? requestWidth,
  }) {
    if (_isAssetPath(imagePathOrUrl)) {
      return AssetImage(imagePathOrUrl);
    }
    return AppNetworkImageProvider(
      _resolveUrl(
        imagePathOrUrl,
        useImageKitEndpoint: useImageKitEndpoint,
        requestWidth: requestWidth,
      ),
    );
  }
}
