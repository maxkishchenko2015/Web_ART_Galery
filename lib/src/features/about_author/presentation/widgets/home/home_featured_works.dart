import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/featured_works_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/painting_viewer.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_name_localization.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/telemetry/analytics_events.dart';

/// "Избранные работы" — hand-picked catalog paintings (Remote Config
/// `MAIN_PICTURES_IDS`, or its bundled fallback), sorted by `pictureId` so
/// the selection and order are identical in every language.
///
/// Desktop: intro text, a strip of equal tiles and a "full catalog" tile.
/// Phone / tablet: header row above a horizontal carousel of captioned cards.
/// Tapping a work opens it full screen with its details (title, size …).
/// Hidden when none of the works can be loaded.
class HomeFeaturedWorks extends StatelessWidget {
  const HomeFeaturedWorks({super.key, required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedWorksCubit, FeaturedWorksState>(
      builder: (context, state) {
        final List<Painting>? paintings = switch (state) {
          FeaturedWorksLoaded(:final paintings) => paintings,
          FeaturedWorksInitial() || FeaturedWorksLoading() => null,
          FeaturedWorksError() => const [],
        };
        if (paintings != null && paintings.isEmpty) {
          return const SizedBox.shrink();
        }

        return layout.isWide
            ? _WideStrip(paintings: paintings)
            : _Carousel(layout: layout, paintings: paintings);
      },
    );
  }
}

void _openPainting(BuildContext context, Painting painting) {
  openPaintingFullscreen(context, painting, heroTag: _heroTag(painting), origin: 'home');
}

void _goToCatalog(BuildContext context) {
  AnalyticsEvents.cta(origin: 'home_featured', target: AppRoutes.catalog);
  context.go(AppRoutes.catalog);
}

String _heroTag(Painting painting) => 'home_featured_${painting.pictureId}';

/// Placeholder tiles while the selection loads.
const int _placeholderCount = KSize.homeFeaturedPlaceholderCount;

// ─── Desktop strip ───────────────────────────────────────────────────────────

class _WideStrip extends StatelessWidget {
  const _WideStrip({required this.paintings});

  /// Null while the catalog loads.
  final List<Painting>? paintings;

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
              GalleryArrowLink(label: t.cta, onTap: () => _goToCatalog(context)),
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
                    ? fit.clamp(1, _placeholderCount).toInt()
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
                    SizedBox(width: KSize.homeFeaturedMoreTileWidth, child: const _MoreTile()),
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
  const _Carousel({required this.layout, required this.paintings});

  final PageLayout layout;
  final List<Painting>? paintings;

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
    final itemCount = (shown?.length ?? _placeholderCount) + 1; // + the "more" card

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
                  onTap: () => _goToCatalog(context),
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
                        ? const _MoreTile()
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
  const _MoreTile();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final label = context.t.home.featured.fullCatalog;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _goToCatalog(context),
        child: Container(
          decoration: BoxDecoration(
            color: colors.moss,
            borderRadius: BorderRadius.circular(KSize.homeCardRadius),
          ),
          padding: const EdgeInsets.all(KSize.margin3x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_library_outlined, size: KSize.iconL, color: colors.onAccent),
              const SizedBox(height: KSize.margin3x),
              Text(label, style: context.textOnDark.tileLabel, textAlign: TextAlign.center),
              const SizedBox(height: KSize.margin3x),
              Icon(Icons.arrow_forward_rounded, size: KSize.iconM, color: colors.onAccent),
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
