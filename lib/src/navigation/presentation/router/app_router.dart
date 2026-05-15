import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/presentation/screens/about_author_page.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/screens/catalog_of_works_page.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page.dart';
import 'package:web_art_galery/src/features/news/presentation/screens/news_page.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/navigation/presentation/router/screen_name_resolver.dart';
import 'package:web_art_galery/src/navigation/presentation/screens/app_shell_page.dart';
import 'package:web_art_galery/src/shared/presentation/screens/placeholder_page.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

// Deferred imports — screens listed here are loaded lazily by `loadLibrary()`
// the first time their route is visited. This keeps the initial JS bundle
// small (main entry → about-author → catalog list). Heavier or less-visited
// screens (detail pages, films, archive) ship as separate code-split chunks
// fetched on demand.
import 'package:web_art_galery/src/features/archive/presentation/screens/archive_page.dart'
    deferred as archive;
import 'package:web_art_galery/src/features/catalog_of_works/presentation/screens/catalog_work_detail_page.dart'
    deferred as catalog_detail;
import 'package:web_art_galery/src/features/films/presentation/screens/films_page.dart'
    deferred as films;
import 'package:web_art_galery/src/features/news/presentation/screens/news_detail_page.dart'
    deferred as news_detail;

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
            pageBuilder: (context, state) {
              final slug = state.pathParameters[AppRoutes.articleSlugParam] ?? '';
              return NoTransitionPage<void>(
                child: _DeferredScreen(
                  loader: news_detail.loadLibrary,
                  builder: () => news_detail.NewsDetailPage(articleSlug: slug),
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.catalog,
        pageBuilder: (context, state) => const NoTransitionPage<void>(child: CatalogOfWorksPage()),
        routes: [
          GoRoute(
            path: AppRoutes.catalogWorkSegment,
            pageBuilder: (context, state) {
              final workId =
                  state.pathParameters[AppRoutes.workIdParam] ?? 'unknown';
              return NoTransitionPage<void>(
                child: _DeferredScreen(
                  loader: catalog_detail.loadLibrary,
                  builder: () => catalog_detail.CatalogWorkDetailPage(workId: workId),
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.films,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          child: _DeferredScreen(
            loader: films.loadLibrary,
            builder: () => films.FilmsPage(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.archive,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          child: _DeferredScreen(
            loader: archive.loadLibrary,
            builder: () => archive.ArchivePage(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.contacts,
        pageBuilder: (context, state) => const NoTransitionPage<void>(child: ContactsPage()),
      ),
    ],
  ),
];

/// Renders a screen whose Dart library has been split out via
/// `deferred as <name>`. While the chunk is being downloaded the
/// `CircularProgressIndicator` placeholder fills the shell content area.
/// The Future is cached at the FutureBuilder level so repeat visits to the
/// same route do not trigger another network round-trip.
class _DeferredScreen extends StatefulWidget {
  const _DeferredScreen({required this.loader, required this.builder});

  final Future<void> Function() loader;
  final Widget Function() builder;

  @override
  State<_DeferredScreen> createState() => _DeferredScreenState();
}

class _DeferredScreenState extends State<_DeferredScreen> {
  late final Future<void> _ready = widget.loader();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _ready,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(context.t.common.pageNotFound),
          );
        }
        return widget.builder();
      },
    );
  }
}
