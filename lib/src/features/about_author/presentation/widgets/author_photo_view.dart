import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/about_author/data/local/about_author_local_photos.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/about_author_cubit.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/fullscreen_image_viewer.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// Renders the about-author photo pinned at [index] of the Firestore
/// `AboutAuthor.items` list (served by [AboutAuthorCubit]).
///
/// Adaptive container modes:
///  * [aspectRatio] given — the frame keeps that ratio at any width;
///  * [aspectRatio] null — the frame fills the parent's (bounded) box, so a
///    layout slot (hero column, card side) decides the shape;
///  * [fitFullImage] — the frame takes the loaded image's own ratio.
///
/// [BoxFit.cover] crops around [alignment], so portraits can keep the face
/// in frame with [Alignment.topCenter]. While the cubit loads a spinner is
/// shown; a missing photo falls back to its bundled copy, then to an icon.
class AuthorPhotoView extends StatelessWidget {
  const AuthorPhotoView({
    super.key,
    required this.index,
    this.aspectRatio,
    this.borderRadius = BorderRadius.zero,
    this.alignment = Alignment.center,
    this.placeholderBackground,
    this.placeholderIcon = Icons.image_outlined,
    this.placeholderIconColor,
    this.placeholderIconSize = KSize.iconHeroPlaceholder,
    this.heroTag,
    this.openFullscreenOnTap = false,
    this.fitFullImage = false,
    this.loaderColor,
  });

  final int index;
  final double? aspectRatio;
  final BorderRadius borderRadius;
  final Alignment alignment;
  final Color? placeholderBackground;
  final IconData placeholderIcon;
  final Color? placeholderIconColor;
  final double placeholderIconSize;
  final Object? heroTag;
  final bool openFullscreenOnTap;
  final Color? loaderColor;

  /// When true the frame matches the loaded image's own aspect ratio (so the
  /// whole image shows with no crop and no letterbox), instead of
  /// [aspectRatio] which is used only as the fallback until the image
  /// resolves. Used for the landscape Chernobyl tapestry.
  final bool fitFullImage;

  /// Photo indices whose bundled fallback was already reported this session —
  /// the error state rebuilds (scroll, resize), the event should fire once.
  static final Set<int> _reportedFallbacks = <int>{};

  /// ImageKit couldn't deliver photo [index]; its bundled copy is shown.
  static void _logPhotoFallback(int index, Object error) {
    if (!_reportedFallbacks.add(index)) return;
    AppTelemetry.instance.logEvent(
      'about_author_photo_fallback',
      params: {'photo_index': index, 'error': error.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final background = placeholderBackground ?? colors.parchmentLine;

    return BlocBuilder<AboutAuthorCubit, AboutAuthorState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        final photo = switch (state) {
          AboutAuthorLoaded() => state.photoAt(index),
          _ => null,
        };
        final isLoading = state is AboutAuthorInitial || state is AboutAuthorLoading;
        final hasPhoto = photo != null && !photo.isEmpty;
        // Bundled copy shown when ImageKit can't deliver this photo.
        final fallbackAsset = AboutAuthorLocalPhotos.assetAt(index);

        Widget inner;
        if (hasPhoto) {
          inner = CachedNetworkImageView(
            imagePathOrUrl: photo.url,
            fit: BoxFit.cover,
            alignment: alignment,
            width: double.infinity,
            height: double.infinity,
            fallbackAssetPath: fallbackAsset,
            onFallbackShown: (error) => _logPhotoFallback(index, error),
          );
          if (heroTag != null) {
            inner = Hero(tag: heroTag!, child: inner);
          }
        } else if (isLoading) {
          inner = Center(child: AppLoader(color: loaderColor));
        } else {
          inner = Center(
            child: Icon(
              placeholderIcon,
              size: placeholderIconSize,
              color: placeholderIconColor ?? colors.onDarkPlaceholderIcon,
            ),
          );
        }

        final Widget frame;
        if (hasPhoto && fitFullImage) {
          frame = LayoutBuilder(
            builder: (context, constraints) => _IntrinsicAspectImage(
              url: photo.url,
              // Same rendition the inner image requests for this frame width.
              requestWidth: constraints.maxWidth.isFinite
                  ? CachedNetworkImageView.requestWidthFor(
                      constraints.maxWidth,
                      fit: BoxFit.cover,
                      devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
                    )
                  : null,
              fallbackAssetPath: fallbackAsset,
              fallbackRatio: aspectRatio ?? KSize.bioPhotoWideAspectRatio,
              borderRadius: borderRadius,
              background: background,
              child: inner,
            ),
          );
        } else {
          final clipped = ClipRRect(
            borderRadius: borderRadius,
            child: DecoratedBox(
              decoration: BoxDecoration(color: background, borderRadius: borderRadius),
              child: inner,
            ),
          );
          final ratio = aspectRatio;
          frame = ratio == null
              ? SizedBox.expand(child: clipped)
              : AspectRatio(aspectRatio: ratio, child: clipped);
        }

        if (!hasPhoto || !openFullscreenOnTap) {
          return frame;
        }

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FullscreenImageViewer.show(
              context,
              imagePathOrUrl: photo.url,
              heroTag: heroTag,
              fallbackAssetPath: fallbackAsset,
            ),
            child: frame,
          ),
        );
      },
    );
  }
}

/// Renders a photo in a frame sized to the image's own aspect ratio, so the
/// whole image is shown (no crop, no letterbox) while the rounded corners are
/// still clipped against the image edges. Uses [fallbackRatio] until the image
/// resolves its intrinsic size.
class _IntrinsicAspectImage extends StatefulWidget {
  const _IntrinsicAspectImage({
    required this.url,
    required this.requestWidth,
    required this.fallbackAssetPath,
    required this.fallbackRatio,
    required this.borderRadius,
    required this.background,
    required this.child,
  });

  final String url;

  /// ImageKit width the ratio probe requests — must match what [child]
  /// renders so both share one download.
  final int? requestWidth;

  /// Bundled copy [child] falls back to; the frame then takes its ratio.
  final String? fallbackAssetPath;
  final double fallbackRatio;
  final BorderRadius borderRadius;
  final Color background;
  final Widget child;

  @override
  State<_IntrinsicAspectImage> createState() => _IntrinsicAspectImageState();
}

class _IntrinsicAspectImageState extends State<_IntrinsicAspectImage> {
  ImageStream? _stream;
  ImageStreamListener? _listener;
  double? _ratio;

  @override
  void initState() {
    super.initState();
    _resolveRatio();
  }

  @override
  void didUpdateWidget(_IntrinsicAspectImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _ratio = null;
      _resolveRatio();
    } else if (oldWidget.requestWidth != widget.requestWidth) {
      _resolveRatio(); // Same image, other size — the ratio is unchanged.
    }
  }

  void _resolveRatio() {
    _listenForRatio(
      CachedNetworkImageView.providerFor(widget.url, requestWidth: widget.requestWidth),
      onError: () {
        // Network photo failed and [child] shows the bundled copy — size the
        // frame to that copy instead.
        final fallback = widget.fallbackAssetPath;
        if (mounted && fallback != null) {
          _listenForRatio(AssetImage(fallback));
        }
      },
    );
  }

  void _listenForRatio(ImageProvider provider, {VoidCallback? onError}) {
    _detachStream();
    final stream = provider.resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener(
      (info, _) {
        final width = info.image.width;
        final height = info.image.height;
        info.dispose();
        if (mounted && height > 0) {
          final ratio = width / height;
          if (ratio != _ratio) {
            setState(() => _ratio = ratio);
          }
        }
      },
      // Deferred: errors can fire synchronously from addListener (cached
      // failure), i.e. while this stream is still being attached.
      onError: (_, _) => scheduleMicrotask(() => onError?.call()),
    );
    stream.addListener(listener);
    _stream = stream;
    _listener = listener;
  }

  void _detachStream() {
    if (_stream != null && _listener != null) {
      _stream!.removeListener(_listener!);
    }
    _stream = null;
    _listener = null;
  }

  @override
  void dispose() {
    _detachStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: AspectRatio(
        aspectRatio: _ratio ?? widget.fallbackRatio,
        child: DecoratedBox(
          decoration: BoxDecoration(color: widget.background, borderRadius: widget.borderRadius),
          child: widget.child,
        ),
      ),
    );
  }
}
