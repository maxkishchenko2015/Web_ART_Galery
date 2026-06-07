import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_medium_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_name_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/aspect_aware_image.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/catalog_lazy_masonry_view.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/decade_filter_bar.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/fullscreen_image_viewer.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

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
    return const _CatalogOfWorksContent();
  }
}

class _CatalogOfWorksContent extends StatelessWidget {
  const _CatalogOfWorksContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogOfWorksCubit, CatalogOfWorksState>(
      builder: (context, state) {
        return switch (state) {
          CatalogOfWorksInitial() ||
          CatalogOfWorksLoading() => const Center(child: AppLoader()),
          // Errors and the all-filtered-out / empty result share the same
          // wordless visual: rendering raw exception strings (e.g. "Null check
          // operator used on a null value") in production was confusing users.
          // The shell also hides the catalog tab in those states, so this view
          // is mostly reached via direct deep links.
          CatalogOfWorksError() => const _CatalogEmptyState(),
          CatalogOfWorksLoaded(paintings: final paintings) when paintings.isEmpty =>
            const _CatalogEmptyState(),
          CatalogOfWorksLoaded() => _CatalogOfWorksLoadedView(state: state),
        };
      },
    );
  }
}

class _CatalogEmptyState extends StatelessWidget {
  const _CatalogEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(KSize.margin8x),
        child: Icon(
          Icons.image_outlined,
          size: KSize.iconHeroPlaceholder,
          color: context.colors.onDarkPlaceholderIcon,
        ),
      ),
    );
  }
}

class _CatalogOfWorksLoadedView extends StatelessWidget {
  const _CatalogOfWorksLoadedView({required this.state});

  final CatalogOfWorksLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DecadeFilterBar(),
        Expanded(
          child: _PaintingsGrid(
            paintings: state.visiblePaintings,
            isLoadingMore: state.isLoadingMore,
            hasReachedMax: state.hasReachedMax,
            isFiltered: state.selectedDecade != null,
          ),
        ),
      ],
    );
  }
}

class _PaintingsGrid extends StatefulWidget {
  const _PaintingsGrid({
    required this.paintings,
    required this.isLoadingMore,
    required this.hasReachedMax,
    required this.isFiltered,
  });

  final List<Painting> paintings;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final bool isFiltered;

  @override
  State<_PaintingsGrid> createState() => _PaintingsGridState();
}

class _PaintingsGridState extends State<_PaintingsGrid> {
  void _onPaintingOpened(Painting painting) {
    AppTelemetry.instance.logEvent('gallery_image_opened', params: _galleryParams(painting));
    FullscreenImageViewer.show(
      context,
      imagePathOrUrl: AspectAwareImage.resolveUrl(painting.imageUrl),
      heroTag: 'catalog_${painting.pictureId}',
      useImageKitEndpoint: false,
    );
  }

  Map<String, Object?> _galleryParams(Painting painting) => <String, Object?>{
    'painting_id': painting.pictureId,
    'painting_title': painting.name,
    'painting_year': painting.yearOfCreation,
  };

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CatalogOfWorksCubit>();

    // While a decade filter is active and no items match yet, the grid
    // would otherwise be empty during the auto-pager's catch-up phase.
    // Surface a centered spinner so the page doesn't look broken.
    if (widget.isFiltered && widget.paintings.isEmpty && !widget.hasReachedMax) {
      return const Center(child: AppLoader());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = width < KSize.adaptiveCompactBreakpoint
            ? 1
            : width < KSize.adaptiveExpandedBreakpoint
            ? 2
            : 3;

        return CatalogLazyMasonryView(
          itemCount: widget.paintings.length,
          isLoading: widget.isLoadingMore,
          hasReachedMax: widget.hasReachedMax,
          onLoadMore: cubit.loadMore,
          padding: const EdgeInsets.fromLTRB(
            KSize.margin4x,
            KSize.margin5x,
            KSize.margin4x,
            KSize.margin12x,
          ),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: KSize.margin7x,
          crossAxisSpacing: KSize.margin4x,
          loadingWidget: const Padding(
            padding: EdgeInsets.symmetric(vertical: KSize.margin5x),
            child: Center(child: AppLoader()),
          ),
          itemBuilder: (context, index) =>
              _PaintingCard(painting: widget.paintings[index], onOpen: _onPaintingOpened),
        );
      },
    );
  }
}

class _PaintingCard extends StatelessWidget {
  const _PaintingCard({required this.painting, required this.onOpen});

  final Painting painting;
  final void Function(Painting painting) onOpen;

  @override
  Widget build(BuildContext context) {
    final localizedName = PaintingNameLocalization.resolveName(
      context.t,
      painting.pictureId,
      firebaseName: painting.name,
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.zoomIn,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onOpen(painting),
              child: Hero(
                tag: 'catalog_${painting.pictureId}',
                child: AspectAwareImage(
                  imageUrl: painting.imageUrl,
                  semanticLabel:
                      '$localizedName (${painting.yearOfCreation}) — '
                      '${PaintingMediumLocalization.resolve(context.t, painting.paintedOnAndHow)}',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              KSize.margin3x,
              KSize.margin3x,
              KSize.margin3x,
              KSize.margin4x,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizedName,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: KSize.margin2x),
                Text(
                  '${painting.yearOfCreation}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: KSize.margin1x),
                Text(
                  PaintingMediumLocalization.resolve(context.t, painting.paintedOnAndHow),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (painting.location.isNotEmpty)
                  Text(
                    painting.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
