import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_art_galery/src/shared/config/app_environment.dart';
import 'package:web_art_galery/src/shared/config/cache/app_cache_manager.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Renders a network image at its intrinsic aspect ratio so the gallery
/// never crops paintings.
///
/// Behaviour:
///  - While the image's intrinsic dimensions are unknown the cell reserves
///    space using [placeholderAspectRatio] (default 4/3) to avoid layout
///    jolt once the real ratio resolves.
///  - Once the underlying [ImageStream] reports the loaded image, the cell
///    animates to that aspect ratio.
///  - If the natural height (cardWidth / ratio) would exceed
///    [maxImageHeight], the cell clamps to [maxImageHeight] and uses
///    `BoxFit.contain` (centred, no crop). Symmetrically, if it would fall
///    below [minImageHeight] (very wide panoramas), the box is held at
///    [minImageHeight] with `BoxFit.contain`.
///  - Between these limits the box matches the image exactly with no
///    letterboxing.
class AspectAwareImage extends StatefulWidget {
  const AspectAwareImage({
    super.key,
    required this.imageUrl,
    this.useImageKitEndpoint = true,
    this.placeholderAspectRatio = 4 / 3,
    this.maxImageHeight = 720,
    this.minImageHeight = 200,
  });

  final String imageUrl;
  final bool useImageKitEndpoint;
  final double placeholderAspectRatio;
  final double maxImageHeight;
  final double minImageHeight;

  @override
  State<AspectAwareImage> createState() => _AspectAwareImageState();
}

class _AspectAwareImageState extends State<AspectAwareImage> {
  Size? _resolvedSize;
  bool _hasError = false;
  ImageStream? _stream;
  ImageStreamListener? _listener;

  @override
  void initState() {
    super.initState();
    _attachStream();
  }

  @override
  void didUpdateWidget(AspectAwareImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl ||
        oldWidget.useImageKitEndpoint != widget.useImageKitEndpoint) {
      _detachStream();
      _resolvedSize = null;
      _hasError = false;
      _attachStream();
    }
  }

  @override
  void dispose() {
    _detachStream();
    super.dispose();
  }

  void _attachStream() {
    final url = _resolveImageUrl(widget.imageUrl);
    final provider = CachedNetworkImageProvider(url, cacheManager: AppCacheManager());
    final stream = provider.resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener(
      _handleImage,
      onError: (Object error, StackTrace? _) {
        if (!mounted) return;
        // Defer to avoid setState during build for cached errors.
        scheduleMicrotask(() {
          if (!mounted) return;
          setState(() => _hasError = true);
        });
      },
    );
    _stream = stream;
    _listener = listener;
    stream.addListener(listener);
  }

  void _detachStream() {
    final stream = _stream;
    final listener = _listener;
    if (stream != null && listener != null) {
      stream.removeListener(listener);
    }
    _stream = null;
    _listener = null;
  }

  void _handleImage(ImageInfo info, bool _) {
    final newSize = Size(info.image.width.toDouble(), info.image.height.toDouble());
    // The listener can fire synchronously during the very first build (cache
    // hit), so defer state mutation to the next microtask.
    scheduleMicrotask(() {
      if (!mounted) return;
      if (_resolvedSize == newSize) return;
      setState(() => _resolvedSize = newSize);
    });
  }

  String _resolveImageUrl(String raw) {
    final uri = Uri.tryParse(raw);
    final isAbsolute = uri != null && uri.hasScheme && uri.host.isNotEmpty;
    if (isAbsolute || !widget.useImageKitEndpoint) return raw;
    return AppEnvironment.imagekitImageUrl(raw);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : widget.maxImageHeight;
        final size = _resolvedSize;

        final aspectRatio = size == null || size.height == 0
            ? widget.placeholderAspectRatio
            : size.width / size.height;

        final naturalHeight = cardWidth / aspectRatio;
        final boxHeight = naturalHeight
            .clamp(widget.minImageHeight, widget.maxImageHeight)
            .toDouble();

        return AnimatedSize(
          duration: KSize.durationStandard,
          alignment: Alignment.topCenter,
          curve: Curves.easeOut,
          child: SizedBox(
            width: cardWidth,
            height: boxHeight,
            child: _buildImage(),
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    if (_hasError) {
      return const Center(child: Icon(Icons.broken_image_outlined));
    }
    return CachedNetworkImage(
      imageUrl: _resolveImageUrl(widget.imageUrl),
      cacheManager: AppCacheManager(),
      fit: BoxFit.contain,
      width: double.infinity,
      height: double.infinity,
      progressIndicatorBuilder: (context, _, downloadProgress) =>
          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, _, _) =>
          const Center(child: Icon(Icons.broken_image_outlined)),
    );
  }
}
