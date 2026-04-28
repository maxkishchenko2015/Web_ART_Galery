import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_medium_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_name_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/aspect_aware_image.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/catalog_lazy_masonry_view.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/fullscreen_image_viewer.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

class CatalogOfWorksPage extends StatelessWidget {
  const CatalogOfWorksPage({super.key});

  @override
  Widget build(BuildContext context) => const _CatalogOfWorksContent();
}

class _CatalogOfWorksContent extends StatelessWidget {
  const _CatalogOfWorksContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogOfWorksCubit, CatalogOfWorksState>(
      builder: (context, state) {
        return switch (state) {
          CatalogOfWorksInitial() ||
          CatalogOfWorksLoading() => const Center(child: CircularProgressIndicator()),
          CatalogOfWorksError(:final message) => Center(
            child: Padding(
              padding: const EdgeInsets.all(KSize.margin4x),
              child: Text('Failed to load paintings. $message', textAlign: TextAlign.center),
            ),
          ),
          CatalogOfWorksLoaded(:final paintings, :final isLoadingMore, :final hasReachedMax) =>
            _PaintingsGrid(
              paintings: paintings,
              isLoadingMore: isLoadingMore,
              hasReachedMax: hasReachedMax,
            ),
        };
      },
    );
  }
}

class _PaintingsGrid extends StatefulWidget {
  const _PaintingsGrid({
    required this.paintings,
    required this.isLoadingMore,
    required this.hasReachedMax,
  });

  final List<Painting> paintings;
  final bool isLoadingMore;
  final bool hasReachedMax;

  @override
  State<_PaintingsGrid> createState() => _PaintingsGridState();
}

class _PaintingsGridState extends State<_PaintingsGrid> {
  // Tracks paintings whose impression event has already fired in this session
  // so we don't spam analytics when the user scrolls back and forth.
  final Set<String> _seenIds = <String>{};

  void _onPaintingVisible(Painting painting, double visibleFraction) {
    if (visibleFraction < 0.5) return;
    if (!_seenIds.add(painting.pictureId)) return;
    AppTelemetry.instance.logEvent(
      'gallery_image_impression',
      params: _galleryParams(painting),
    );
  }

  void _onPaintingOpened(Painting painting) {
    AppTelemetry.instance.logEvent(
      'gallery_image_opened',
      params: _galleryParams(painting),
    );
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
            child: Center(child: CircularProgressIndicator()),
          ),
          itemBuilder: (context, index) => _PaintingCard(
            painting: widget.paintings[index],
            onVisible: _onPaintingVisible,
            onOpen: _onPaintingOpened,
          ),
        );
      },
    );
  }
}

class _PaintingCard extends StatelessWidget {
  const _PaintingCard({
    required this.painting,
    required this.onVisible,
    required this.onOpen,
  });

  final Painting painting;
  final void Function(Painting painting, double visibleFraction) onVisible;
  final void Function(Painting painting) onOpen;

  @override
  Widget build(BuildContext context) {
    final localizedName = PaintingNameLocalization.resolveName(
      context.t,
      painting.pictureId,
      firebaseName: painting.name,
    );

    return VisibilityDetector(
      key: ValueKey('catalog_${painting.pictureId}'),
      onVisibilityChanged: (info) => onVisible(painting, info.visibleFraction),
      child: Container(
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
                  child: AspectAwareImage(imageUrl: painting.imageUrl),
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
                    PaintingMediumLocalization.resolve(
                      context.t,
                      painting.paintedOnAndHow,
                    ),
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
      ),
    );
  }
}
