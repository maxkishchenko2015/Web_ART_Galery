import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/painting_viewer.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_dimensions.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_medium_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_name_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/catalog_lazy_grid_view.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/decade_filter_bar.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/gallery_footer.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/page_chrome.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cubit_initializer.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';

class CatalogOfWorksPage extends StatelessWidget {
  const CatalogOfWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      MetaSEO()
        ..ogTitle(ogTitle: context.t.seo.catalog.title)
        ..description(description: context.t.seo.catalog.description)
        ..keywords(keywords: context.t.seo.catalog.keywords);
    }
    // Kick off the first page load only when the catalog route is visited
    // (the cubit's own `is Loaded` guard makes revisits a no-op).
    return CubitInitializer(
      onInit: (context) => context.read<CatalogOfWorksCubit>().loadInitial(),
      child: LayoutBuilder(
        builder: (context, constraints) =>
            _CatalogOfWorksContent(layout: PageLayout(constraints.maxWidth)),
      ),
    );
  }
}

class _CatalogOfWorksContent extends StatelessWidget {
  const _CatalogOfWorksContent({required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final hero = PageHero(
      layout: layout,
      eyebrow: context.t.pages.catalog.eyebrow,
      title: context.t.navigation.catalogOfWorks,
      subtitle: context.t.pages.catalog.subtitle,
    );
    final footer = GalleryFooter(gutter: layout.gutter, isPhone: layout.isPhone);

    return BlocBuilder<CatalogOfWorksCubit, CatalogOfWorksState>(
      builder: (context, state) {
        // Errors and the empty result share the same wordless visual:
        // rendering raw exception strings in production confused users. The
        // shell also hides the catalog tab in those states, so this view is
        // mostly reached via direct deep links.
        final Widget? placeholder = switch (state) {
          CatalogOfWorksInitial() || CatalogOfWorksLoading() => const Center(child: AppLoader()),
          CatalogOfWorksError() => const _CatalogEmptyState(),
          CatalogOfWorksLoaded(paintings: final paintings) when paintings.isEmpty =>
            const _CatalogEmptyState(),
          CatalogOfWorksLoaded() => null,
        };
        if (placeholder != null || state is! CatalogOfWorksLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                hero,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: KSize.margin15x),
                  child: placeholder,
                ),
                footer,
              ],
            ),
          );
        }

        return _PaintingsGrid(
          layout: layout,
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              hero,
              _FilterRow(layout: layout, state: state),
            ],
          ),
          footer: footer,
          paintings: state.visiblePaintings,
          isLoadingMore: state.isLoadingMore,
          hasReachedMax: state.hasReachedMax,
          isFiltered: state.selectedDecade != null,
        );
      },
    );
  }
}

class _CatalogEmptyState extends StatelessWidget {
  const _CatalogEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.image_outlined,
        size: KSize.iconHeroPlaceholder,
        color: context.colors.contentMuted.withValues(alpha: 0.5),
      ),
    );
  }
}

/// "Период:" + decade chips, and the number of works once the whole catalog
/// is loaded (a partial page count would understate it).
class _FilterRow extends StatelessWidget {
  const _FilterRow({required this.layout, required this.state});

  final PageLayout layout;
  final CatalogOfWorksLoaded state;

  @override
  Widget build(BuildContext context) {
    final t = context.t.pages.catalog;
    final count = state.hasReachedMax
        ? Text(
            t.found(count: state.visiblePaintings.length),
            style: context.textContent.quickLinkSubtitle,
          )
        : null;

    return Padding(
      padding: EdgeInsets.fromLTRB(layout.gutter, KSize.margin6x, layout.gutter, 0),
      child: Container(
        padding: const EdgeInsets.only(bottom: KSize.margin5x),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: context.colors.parchmentLine)),
        ),
        child: layout.isPhone
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DecadeFilterBar(compact: true),
                  if (count != null) ...[const SizedBox(height: KSize.margin3x), count],
                ],
              )
            : Row(
                children: [
                  Text(t.period, style: context.textContent.fieldCaption),
                  const SizedBox(width: KSize.margin5x),
                  const Expanded(child: DecadeFilterBar()),
                  if (count != null) ...[const SizedBox(width: KSize.margin5x), count],
                ],
              ),
      ),
    );
  }
}

class _PaintingsGrid extends StatefulWidget {
  const _PaintingsGrid({
    required this.layout,
    required this.header,
    required this.footer,
    required this.paintings,
    required this.isLoadingMore,
    required this.hasReachedMax,
    required this.isFiltered,
  });

  final PageLayout layout;
  final Widget header;
  final Widget footer;
  final List<Painting> paintings;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final bool isFiltered;

  @override
  State<_PaintingsGrid> createState() => _PaintingsGridState();
}

class _PaintingsGridState extends State<_PaintingsGrid> {
  void _onPaintingOpened(Painting painting) {
    openPaintingFullscreen(context, painting, heroTag: 'catalog_${painting.pictureId}');
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CatalogOfWorksCubit>();
    final layout = widget.layout;

    // While a decade filter is active and no items match yet, the grid
    // would otherwise be empty during the auto-pager's catch-up phase.
    // Surface a spinner so the page doesn't look broken; the filter stays
    // visible so the user can switch decade.
    if (widget.isFiltered && widget.paintings.isEmpty && !widget.hasReachedMax) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            widget.header,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: KSize.margin15x),
              child: Center(child: AppLoader()),
            ),
            widget.footer,
          ],
        ),
      );
    }

    final columns = layout.isPhone
        ? 2
        : layout.contentWidth < KSize.catalogFourColumnBreakpoint
        ? 3
        : 4;
    final spacing = layout.isPhone ? KSize.margin3x : KSize.margin5x;
    const cardPadding = KSize.margin2x;
    final cardWidth = (layout.width - layout.gutter * 2 - spacing * (columns - 1)) / columns;
    final imageRatio = layout.isPhone
        ? KSize.catalogImageAspectRatioPhone
        : KSize.catalogImageAspectRatioWide;
    final caption = layout.isPhone
        ? KSize.catalogCaptionHeightPhone
        : KSize.catalogCaptionHeightWide;
    final cardHeight = (cardWidth - cardPadding * 2) / imageRatio + caption + cardPadding * 2;

    return CatalogLazyGridView(
      itemCount: widget.paintings.length,
      isLoading: widget.isLoadingMore,
      hasReachedMax: widget.hasReachedMax,
      onLoadMore: cubit.loadMore,
      header: widget.header,
      footer: Padding(
        padding: EdgeInsets.only(top: layout.sectionGap),
        child: widget.footer,
      ),
      padding: EdgeInsets.fromLTRB(layout.gutter, layout.sectionGap, layout.gutter, 0),
      crossAxisCount: columns,
      childAspectRatio: cardWidth / cardHeight,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      loadingWidget: const Padding(
        padding: EdgeInsets.symmetric(vertical: KSize.margin5x),
        child: Center(child: AppLoader()),
      ),
      itemBuilder: (context, index) => _PaintingCard(
        painting: widget.paintings[index],
        isPhone: layout.isPhone,
        onOpen: _onPaintingOpened,
      ),
    );
  }
}

class _PaintingCard extends StatefulWidget {
  const _PaintingCard({required this.painting, required this.isPhone, required this.onOpen});

  final Painting painting;
  final bool isPhone;
  final void Function(Painting painting) onOpen;

  @override
  State<_PaintingCard> createState() => _PaintingCardState();
}

class _PaintingCardState extends State<_PaintingCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final painting = widget.painting;
    final isPhone = widget.isPhone;
    final localizedName = PaintingNameLocalization.resolveName(
      context.t,
      painting.pictureId,
      firebaseName: painting.name,
    );
    final fullMedium = PaintingMediumLocalization.resolve(context.t, painting.paintedOnAndHow);
    // The size often doesn't fit the card — it's shown in the fullscreen
    // details panel instead.
    final medium = PaintingDimensions.stripFrom(fullMedium);
    final metaStyle = context.textContent.quickLinkSubtitle;

    return MouseRegion(
      cursor: SystemMouseCursors.zoomIn,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GalleryCard(
        onTap: () => widget.onOpen(painting),
        padding: const EdgeInsets.all(KSize.margin2x),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Fills what the fixed grid cell leaves after the caption, so
            // the cell size never depends on the image's decoded size.
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(KSize.radiusDefaultSmall),
                child: AnimatedScale(
                  scale: _hovered ? 1.03 : 1,
                  duration: KSize.durationMedium,
                  curve: Curves.easeOut,
                  child: Hero(
                    tag: 'catalog_${painting.pictureId}',
                    child: CachedNetworkImageView(
                      imagePathOrUrl: painting.imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      semanticLabel: '$localizedName (${painting.yearOfCreation}) — $fullMedium',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                KSize.margin1Halfx,
                KSize.margin3x,
                KSize.margin1Halfx,
                KSize.margin1x,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          localizedName,
                          style: context.textContent.homeTitle(
                            isPhone ? KSize.fontSizeM : KSize.fontSizeL,
                          ),
                          maxLines: isPhone ? 2 : 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: KSize.margin1Halfx),
                        if (isPhone) ...[
                          Text('${painting.yearOfCreation}', style: context.textContent.cardDate),
                          const SizedBox(height: KSize.margin1x),
                          Text(
                            medium,
                            style: metaStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ] else
                          Text(
                            '${painting.yearOfCreation}  ·  $medium',
                            style: metaStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: KSize.margin2x),
                  GalleryCircleArrow(
                    size: isPhone ? KSize.avatarXS : KSize.avatarXSHalf + KSize.margin1x,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
