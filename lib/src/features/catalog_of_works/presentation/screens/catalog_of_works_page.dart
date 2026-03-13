import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/api/catalog_of_works_api_controller.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/repository/catalog_of_works_repository_firebase.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_name_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/catalog_lazy_grid_view.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';

class CatalogOfWorksPage extends StatelessWidget {
  const CatalogOfWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatalogOfWorksCubit>(
      create: (_) => CatalogOfWorksCubit(
        repository: CatalogOfWorksRepositoryFirebase(apiController: CatalogOfWorksApiController()),
      )..loadInitial(),
      child: const _CatalogOfWorksContent(),
    );
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

class _PaintingsGrid extends StatelessWidget {
  const _PaintingsGrid({
    required this.paintings,
    required this.isLoadingMore,
    required this.hasReachedMax,
  });

  final List<Painting> paintings;
  final bool isLoadingMore;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CatalogOfWorksCubit>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final maxCrossAxisExtent = width < KSize.adaptiveCompactBreakpoint
            ? width
            : width < KSize.adaptiveExpandedBreakpoint
            ? 460.0
            : 520.0;

        return CatalogLazyGridView(
          itemCount: paintings.length,
          isLoading: isLoadingMore,
          hasReachedMax: hasReachedMax,
          onLoadMore: cubit.loadMore,
          padding: const EdgeInsets.fromLTRB(
            KSize.margin4x,
            KSize.margin5x,
            KSize.margin4x,
            KSize.margin12x,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: maxCrossAxisExtent,
            mainAxisSpacing: KSize.margin7x,
            crossAxisSpacing: KSize.margin4x,
            childAspectRatio: width < KSize.adaptiveCompactBreakpoint ? 0.80 : 0.72,
          ),
          loadingWidget: const Padding(
            padding: EdgeInsets.symmetric(vertical: KSize.margin5x),
            child: Center(child: CircularProgressIndicator()),
          ),
          itemBuilder: (context, index) => _PaintingCard(painting: paintings[index]),
        );
      },
    );
  }
}

class _PaintingCard extends StatelessWidget {
  const _PaintingCard({required this.painting});

  final Painting painting;

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
          Expanded(
            flex: 8,
            child: CachedNetworkImageView(
              imagePathOrUrl: painting.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.zero,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
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
                    painting.paintedOnAndHow,
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
          ),
        ],
      ),
    );
  }
}
