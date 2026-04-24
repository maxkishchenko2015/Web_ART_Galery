import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';

/// Presents [imagePathOrUrl] as a full-size, pan-and-zoom overlay.
///
/// Designed for any tap-to-expand interaction (gallery photos, hero images,
/// etc.). Dismissible via:
///   * tap on the dimmed barrier,
///   * close button,
///   * `Esc` key (desktop / web).
///
/// Pass [heroTag] to animate a thumbnail into the overlay using a [Hero].
class FullscreenImageViewer {
  const FullscreenImageViewer._();

  /// Shows the viewer; resolves when the overlay is dismissed.
  static Future<void> show(
    BuildContext context, {
    required String imagePathOrUrl,
    Object? heroTag,
    bool useImageKitEndpoint = true,
  }) {
    if (imagePathOrUrl.trim().isEmpty) {
      return Future<void>.value();
    }

    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      transitionDuration: KSize.durationMedium,
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return _FullscreenImageOverlay(
          imagePathOrUrl: imagePathOrUrl,
          heroTag: heroTag,
          useImageKitEndpoint: useImageKitEndpoint,
        );
      },
      transitionBuilder: (dialogContext, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.96, end: 1).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}

class _FullscreenImageOverlay extends StatefulWidget {
  const _FullscreenImageOverlay({
    required this.imagePathOrUrl,
    required this.heroTag,
    required this.useImageKitEndpoint,
  });

  final String imagePathOrUrl;
  final Object? heroTag;
  final bool useImageKitEndpoint;

  @override
  State<_FullscreenImageOverlay> createState() => _FullscreenImageOverlayState();
}

class _FullscreenImageOverlayState extends State<_FullscreenImageOverlay> {
  static const double _minScale = 1.0;
  static const double _maxScale = 4.0;

  final _transformationController = TransformationController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  KeyEventResult _handleKey(FocusNode _, KeyEvent event) {
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape) {
      Navigator.of(context).maybePop();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.sizeOf(context);
    final viewportPadding = EdgeInsets.symmetric(
      horizontal: mediaSize.width < KSize.adaptiveCompactBreakpoint
          ? KSize.margin4x
          : KSize.margin12x,
      vertical: mediaSize.height < KSize.adaptiveCompactBreakpoint
          ? KSize.margin4x
          : KSize.margin8x,
    );

    final image = CachedNetworkImageView(
      imagePathOrUrl: widget.imagePathOrUrl,
      fit: BoxFit.contain,
      useImageKitEndpoint: widget.useImageKitEndpoint,
    );

    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).maybePop(),
                  child: Padding(
                    padding: viewportPadding,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        onDoubleTap: _toggleZoom,
                        child: InteractiveViewer(
                          transformationController: _transformationController,
                          minScale: _minScale,
                          maxScale: _maxScale,
                          clipBehavior: Clip.none,
                          child: widget.heroTag != null
                              ? Hero(tag: widget.heroTag!, child: image)
                              : image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: KSize.margin3x,
                right: KSize.margin3x,
                child: _CloseButton(onPressed: () => Navigator.of(context).maybePop()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleZoom() {
    final currentScale = _transformationController.value.getMaxScaleOnAxis();
    final targetScale = currentScale > 1.01 ? _minScale : 2.0;
    _transformationController.value = Matrix4.identity()
      ..scaleByDouble(targetScale, targetScale, 1.0, 1.0);
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: KSize.blurIntensityHorizontal,
            sigmaY: KSize.blurIntensityVertical,
          ),
          child: Material(
            color: Colors.white.withValues(alpha: 0.12),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onPressed,
              child: const Padding(
                padding: EdgeInsets.all(KSize.margin2x),
                child: Icon(Icons.close, color: Colors.white, size: KSize.iconM),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
