import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/presentation/screens/about_author_page.dart';
import 'package:web_art_galery/src/features/archive/presentation/screens/archive_page.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/screens/catalog_of_works_page.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/screens/catalog_work_detail_page.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page.dart';
import 'package:web_art_galery/src/features/films/presentation/screens/films_page.dart';
import 'package:web_art_galery/src/features/news/presentation/screens/news_detail_page.dart';
import 'package:web_art_galery/src/features/news/presentation/screens/news_page.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/navigation/presentation/router/screen_name_resolver.dart';
import 'package:web_art_galery/src/navigation/presentation/screens/app_shell_page.dart';
import 'package:web_art_galery/src/shared/presentation/screens/placeholder_page.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

final appRouter = _buildAppRouter();

GoRouter _buildAppRouter() {
  final router = GoRouter(
    initialLocation: AppRoutes.aboutAuthor,
    redirect: (context, state) {
      if (state.uri.path == '/') {
        return AppRoutes.aboutAuthor;
      }

      return null;
    },
    routes: _routes,
    errorBuilder: (context, state) =>
        AppShellMenu(child: PlaceholderPage(title: context.t.common.pageNotFound)),
  );
  router.routerDelegate.addListener(() {
    final path = router.routerDelegate.currentConfiguration.uri.path;
    final screenName = ScreenNameResolver.fromPath(path);
    AppTelemetry.instance.logScreenView(screenName: screenName);
  });
  return router;
}

final List<RouteBase> _routes = [
  ShellRoute(
    pageBuilder: (context, state, child) =>
        NoTransitionPage<void>(child: AppShellMenu(child: child)),
    routes: [
      GoRoute(
        path: AppRoutes.aboutAuthor,
        pageBuilder: (context, state) => const NoTransitionPage<void>(child: AboutAuthorPage()),
      ),
      GoRoute(
        path: AppRoutes.news,
        pageBuilder: (context, state) => const NoTransitionPage<void>(child: NewsPage()),
        routes: [
          GoRoute(
            path: AppRoutes.newsArticleSegment,
            pageBuilder: (context, state) => NoTransitionPage<void>(
              child: NewsDetailPage(
                articleSlug: state.pathParameters[AppRoutes.articleSlugParam] ?? '',
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.catalog,
        pageBuilder: (context, state) => const NoTransitionPage<void>(child: CatalogOfWorksPage()),
        routes: [
          GoRoute(
            path: AppRoutes.catalogWorkSegment,
            pageBuilder: (context, state) => NoTransitionPage<void>(
              child: CatalogWorkDetailPage(
                workId: state.pathParameters[AppRoutes.workIdParam] ?? 'unknown',
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.films,
        pageBuilder: (context, state) => const NoTransitionPage<void>(child: FilmsPage()),
      ),
      GoRoute(
        path: AppRoutes.archive,
        pageBuilder: (context, state) => const NoTransitionPage<void>(child: ArchivePage()),
      ),
      GoRoute(
        path: AppRoutes.contacts,
        pageBuilder: (context, state) => const NoTransitionPage<void>(child: ContactsPage()),
      ),
    ],
  ),
];
