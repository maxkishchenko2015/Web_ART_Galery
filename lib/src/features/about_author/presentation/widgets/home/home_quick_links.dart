import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/nav_destinations.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/shared/telemetry/analytics_events.dart';

/// Home-page section shortcuts: catalog, news, films, archive. Catalog / news
/// drop out when their Firestore content settled empty, the same rule the
/// header menu follows.
class HomeQuickLinks extends StatelessWidget {
  const HomeQuickLinks({super.key, required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final newsState = context.watch<NewsListCubit>().state;
    final catalogState = context.watch<CatalogOfWorksCubit>().state;
    final t = context.t;

    return GalleryQuickLinks(
      layout: layout,
      links: [
        if (!NavVisibility.catalogIsSettledEmpty(catalogState))
          GalleryQuickLink(
            title: t.navigation.catalogOfWorks,
            subtitle: t.home.links.catalog,
            icon: Icons.image_outlined,
            onTap: () => _go(context, AppRoutes.catalog),
          ),
        if (!NavVisibility.newsIsSettledEmpty(newsState))
          GalleryQuickLink(
            title: t.navigation.news,
            subtitle: t.home.links.news,
            icon: Icons.article_outlined,
            onTap: () => _go(context, AppRoutes.news),
          ),
        GalleryQuickLink(
          title: t.navigation.films,
          subtitle: t.home.links.films,
          icon: Icons.smart_display_outlined,
          onTap: () => _go(context, AppRoutes.films),
        ),
        GalleryQuickLink(
          title: t.navigation.archive,
          subtitle: t.home.links.archive,
          icon: Icons.inventory_2_outlined,
          onTap: () => _go(context, AppRoutes.archive),
        ),
      ],
    );
  }
}

void _go(BuildContext context, String location) {
  AnalyticsEvents.cta(origin: 'home_quick_links', target: location);
  context.go(location);
}
