import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_art_galery/src/shared/config/app_environment.dart';
import 'package:web_art_galery/src/shared/config/cache/app_cache_manager.dart';

/// Renders a network image at its intrinsic aspect ratio so the gallery
/// never crops paintings.
///
/// Behaviour:
///  - While the image's intrinsic dimensions are unknown the cell reserves
///    space using [placeholderAspectRatio] (default 4/3) so that once the
///    real ratio resolves the box snaps to the correct size.
///  - When the parent supplies a finite width budget (the common case
///    inside a masonry/list cell), `cardWidth = constraints.maxWidth`.
///    When the parent provides unbounded width (e.g. inside a sliver that
///    never lays out a bounded width), we fall back to [maxImageWidth] so
///    that the layout is computed against an actual width budget — never
///    a height constant (which used to silently distort aspect ratios).
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
    this.maxImageWidth = 720,
    this.maxImageHeight = 720,
    this.minImageHeight = 200,
  });

  final String imageUrl;
  final bool useImageKitEndpoint;
  final double placeholderAspectRatio;

  /// Width budget used when the parent provides unbounded constraints.
  /// Never confuse with [maxImageHeight] — this is a width.
  final double maxImageWidth;
  final double maxImageHeight;
  final double minImageHeight;

  @override
  State<AspectAwareImage> createState() => _AspectAwareImageState();

  /// Public mirror of the internal URL resolver so callers (overlay/full-screen
  /// viewer, telemetry, etc.) can route through the same ImageKit endpoint
  /// resolution.
  static String resolveUrl(String raw, {bool useImageKitEndpoint = true}) {
    final uri = Uri.tryParse(raw);
    final isAbsolute = uri != null && uri.hasScheme && uri.host.isNotEmpty;
    if (isAbsolute || !useImageKitEndpoint) return raw;
    return AppEnvironment.imagekitImageUrl(raw);
  }
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

  String _resolveImageUrl(String raw) =>
      AspectAwareImage.resolveUrl(raw, useImageKitEndpoint: widget.useImageKitEndpoint);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : widget.maxImageWidth;
        final size = _resolvedSize;

        final aspectRatio = size == null || size.height == 0
            ? widget.placeholderAspectRatio
            : size.width / size.height;

        final naturalHeight = cardWidth / aspectRatio;
        final boxHeight = naturalHeight
            .clamp(widget.minImageHeight, widget.maxImageHeight)
            .toDouble();

        // No AnimatedSize: animating the cell as each image stream resolves
        // its intrinsic size causes the masonry to reflow mid-scroll, which
        // shows up as cards "jumping" up and down. Snapping to the resolved
        // ratio in a single frame is far less disruptive.
        return SizedBox(
          width: cardWidth,
          height: boxHeight,
          child: _buildImage(),
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