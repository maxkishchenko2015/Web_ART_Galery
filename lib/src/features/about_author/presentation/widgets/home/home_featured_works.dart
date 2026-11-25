import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_name_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/aspect_aware_image.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/fullscreen_image_viewer.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// "Избранные работы" — the first paintings of the Firestore catalog.
///
/// Desktop: intro text, a strip of equal tiles (as many as fit) and a
/// "more works" tile. Phone / tablet: header row above a horizontal carousel
/// of captioned cards. Tapping a work opens it full screen, like the catalog.
/// Hidden when the catalog has nothing to show.
class HomeFeaturedWorks extends StatelessWidget {
  const HomeFeaturedWorks({super.key, required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogOfWorksCubit, CatalogOfWorksState>(
      builder: (context, state) {
        final List<Painting>? paintings = switch (state) {
          CatalogOfWorksLoaded(:final paintings) => paintings,
          CatalogOfWorksInitial() || CatalogOfWorksLoading() => null,
          CatalogOfWorksError() => const [],
        };
        if (paintings != null && paintings.isEmpty) {
          return const SizedBox.shrink();
        }
        final hasReachedMax = state is CatalogOfWorksLoaded && state.hasReachedMax;

        return layout.isWide
            ? _WideStrip(paintings: paintings, hasReachedMax: hasReachedMax)
            : _Carousel(layout: layout, paintings: paintings, hasReachedMax: hasReachedMax);
      },
    );
  }
}

void _openPainting(BuildContext context, Painting painting) {
  AppTelemetry.instance.logEvent(
    'gallery_image_opened',
    params: <String, Object?>{
      'painting_id': painting.pictureId,
      'painting_title': painting.name,
      'painting_year': painting.yearOfCreation,
      'origin': 'home',
    },
  );
  FullscreenImageViewer.show(
    context,
    imagePathOrUrl: AspectAwareImage.resolveUrl(painting.imageUrl),
    heroTag: _heroTag(painting),
    useImageKitEndpoint: false,
  );
}

String _heroTag(Painting painting) => 'home_featured_${painting.pictureId}';

// ─── Desktop strip ───────────────────────────────────────────────────────────

class _WideStrip extends StatelessWidget {
  const _WideStrip({required this.paintings, required this.hasReachedMax});

  /// Null while the catalog loads.
  final List<Painting>? paintings;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    final t = context.t.home.featured;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: KSize.homeFeaturedIntroWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GalleryEyebrow(text: t.label, showRule: false),
              const SizedBox(height: KSize.margin3x),
              Text(t.title, style: context.textContent.homeTitle(KSize.br6fontSize4XLHalf)),
              const SizedBox(height: KSize.margin5x),
              GalleryArrowLink(label: t.cta, onTap: () => context.go(AppRoutes.catalog)),
            ],
          ),
        ),
        const SizedBox(width: KSize.margin6x),
        Expanded(
          child: SizedBox(
            height: KSize.homeFeaturedTileHeightWide,
            child: LayoutBuilder(
              builder: (context, constraints) {
                const gap = KSize.margin4x;
                final room = constraints.maxWidth - KSize.homeFeaturedMoreTileWidth - gap;
                final fit = ((room + gap) / (KSize.homeFeaturedTileMinWidth + gap)).floor();
                final int count = paintings == null
                    ? fit.clamp(1, KSize.homeFeaturedMaxTiles).toInt()
                    : fit.clamp(1, math.min(KSize.homeFeaturedMaxTiles, paintings!.length)).toInt();
                final shown = paintings?.take(count).toList();

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < count; i++) ...[
                      Expanded(
                        child: shown == null
                            ? const _LoadingTile()
                            : _WorkTile(painting: shown[i], showCaption: false),
                      ),
                      const SizedBox(width: gap),
                    ],
                    SizedBox(
                      width: KSize.homeFeaturedMoreTileWidth,
                      child: _MoreTile(
                        remaining: paintings == null ? null : paintings!.length - count,
                        hasReachedMax: hasReachedMax,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Phone / tablet carousel ─────────────────────────────────────────────────

class _Carousel extends StatefulWidget {
  const _Carousel({required this.layout, required this.paintings, required this.hasReachedMax});

  final PageLayout layout;
  final List<Painting>? paintings;
  final bool hasReachedMax;

  @override
  State<_Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<_Carousel> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Mouse-wheel → horizontal scroll, for tablets / narrow desktop windows.
  void _handlePointerSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent || !_controller.hasClients) return;
    final delta = event.scrollDelta.dy != 0 ? event.scrollDelta.dy : event.scrollDelta.dx;
    if (delta == 0) return;
    final position = _controller.position;
    _controller.jumpTo(
      (position.pixels + delta).clamp(position.minScrollExtent, position.maxScrollExtent),
    );
  }

  @override
  Widget build(BuildContext context) {
    final layout = widget.layout;
    final t = context.t.home.featured;
    final paintings = widget.paintings;
    final cardWidth = layout.isPhone
        ? layout.width * KSize.homeFeaturedCardWidthFactorCompact
        : KSize.floatingMenuMaxWidth + KSize.margin10x;
    final cardHeight = cardWidth / KSize.homeFeaturedCardAspectRatioCompact;
    final shown = paintings?.take(KSize.homeFeaturedMaxTiles).toList();
    final itemCount = (shown?.length ?? 2) + 1; // + the "more" card

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.gutter),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GalleryEyebrow(text: t.label, showRule: false),
                    const SizedBox(height: KSize.margin2x),
                    Text(t.title, style: context.textContent.homeTitle(layout.sectionTitleSize)),
                  ],
                ),
              ),
              const SizedBox(width: KSize.margin3x),
              // Flexible: the link's own Row needs a bounded width.
              Flexible(
                child: GalleryArrowLink(
                  label: t.cta,
                  uppercase: false,
                  onTap: () => context.go(AppRoutes.catalog),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: KSize.margin5x),
        SizedBox(
          height: cardHeight,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
              dragDevices: const {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.stylus,
              },
            ),
            child: Listener(
              onPointerSignal: _handlePointerSignal,
              child: ListView.separated(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: layout.gutter),
                itemCount: itemCount,
                separatorBuilder: (_, _) => const SizedBox(width: KSize.margin3x),
                itemBuilder: (context, index) {
                  final isMore = index == itemCount - 1;
                  return SizedBox(
                    width: isMore ? cardWidth * 0.5 : cardWidth,
                    child: isMore
                        ? _MoreTile(
                            remaining: paintings == null ? null : paintings.length - shown!.length,
                            hasReachedMax: widget.hasReachedMax,
                          )
                        : shown == null
                        ? const _LoadingTile()
                        : _WorkTile(painting: shown[index], showCaption: true),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Tiles ───────────────────────────────────────────────────────────────────

class _WorkTile extends StatefulWidget {
  const _WorkTile({required this.painting, required this.showCaption});

  final Painting painting;
  final bool showCaption;

  @override
  State<_WorkTile> createState() => _WorkTileState();
}

class _WorkTileState extends State<_WorkTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final painting = widget.painting;
    final name = PaintingNameLocalization.resolveName(
      context.t,
      painting.pictureId,
      firebaseName: painting.name,
    );
    final showCaption = widget.showCaption || _hovered;

    return MouseRegion(
      cursor: SystemMouseCursors.zoomIn,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _openPainting(context, painting),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(KSize.homeCardRadius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: colors.parchmentLine),
              AnimatedScale(
                scale: _hovered ? 1.04 : 1,
                duration: KSize.durationMedium,
                curve: Curves.easeOut,
                child: Hero(
                  tag: _heroTag(painting),
                  child: CachedNetworkImageView(
                    imagePathOrUrl: painting.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    semanticLabel: '$name (${painting.yearOfCreation})',
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: AnimatedOpacity(
                  opacity: showCaption ? 1 : 0,
                  duration: KSize.durationMedium,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          colors.shell.withValues(alpha: 0),
                          colors.shell.withValues(alpha: 0.85),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        KSize.margin4x,
                        KSize.margin8x,
                        KSize.margin4x,
                        KSize.margin3x,
                      ),
                      child: Text(
                        '$name, ${painting.yearOfCreation}',
                        style: context.textOnDark.photoCaption,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({required this.remaining, required this.hasReachedMax});

  /// Paintings left after the shown tiles; null while loading.
  final int? remaining;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final t = context.t.home.featured;
    final remaining = this.remaining;
    // An exact count only when the whole catalog is loaded; otherwise the
    // loaded page size would understate it.
    final label = hasReachedMax && remaining != null && remaining > 0
        ? '+$remaining\n${t.moreInCatalog}'
        : t.fullCatalog;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.go(AppRoutes.catalog),
        child: Container(
          decoration: BoxDecoration(
            color: colors.moss,
            borderRadius: BorderRadius.circular(KSize.homeCardRadius),
          ),
          padding: const EdgeInsets.all(KSize.margin3x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_library_outlined, size: KSize.iconL, color: colors.onDarkBody),
              const SizedBox(height: KSize.margin3x),
              Text(label, style: context.textOnDark.tileLabel, textAlign: TextAlign.center),
              const SizedBox(height: KSize.margin3x),
              Icon(Icons.arrow_forward_rounded, size: KSize.iconM, color: colors.onDark),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingTile extends StatelessWidget {
  const _LoadingTile();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.parchmentLine,
        borderRadius: BorderRadius.circular(KSize.homeCardRadius),
      ),
      child: const Center(child: AppLoader()),
    );
  }
}
