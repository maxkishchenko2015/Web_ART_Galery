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
import 'package:web_art_galery/src/shared/platform/page_reload/page_reload.dart';
import 'package:web_art_galery/src/shared/presentation/screens/placeholder_page.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
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
                  routeKey: 'news_detail',
                  loader: () => news_detail.loadLibrary(),
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
                  routeKey: 'catalog_detail',
                  loader: () => catalog_detail.loadLibrary(),
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
            routeKey: 'films',
            loader: () => films.loadLibrary(),
            builder: () => films.FilmsPage(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.archive,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          child: _DeferredScreen(
            routeKey: 'archive',
            loader: () => archive.loadLibrary(),
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
/// [AppLoader] placeholder fills the shell content area.
/// The Future is cached at the FutureBuilder level so repeat visits to the
/// same route do not trigger another network round-trip.
///
/// When `loadLibrary()` rejects (most commonly a stale tab requesting a
/// content-hashed chunk that no longer exists after a redeploy → 404,
/// surfacing as "Deferred library archive was not loaded"), the screen
/// hard-reloads the page once to pull the fresh `main.dart.js` + manifest.
/// If the reload already happened (or on a non-web platform), it falls back
/// to an inline error with a Retry button instead of crashing the route.
class _DeferredScreen extends StatefulWidget {
  const _DeferredScreen({
    required this.routeKey,
    required this.loader,
    required this.builder,
  });

  /// Stable per-route identifier for the one-shot reload guard.
  final String routeKey;
  final Future<void> Function() loader;
  final Widget Function() builder;

  @override
  State<_DeferredScreen> createState() => _DeferredScreenState();
}

class _DeferredScreenState extends State<_DeferredScreen> {
  late Future<Widget> _page = _load();

  // Construct the deferred widget INSIDE the async gap, immediately after the
  // load completes. Accessing a `deferred as` symbol must happen in the same
  // continuation as its confirmed load — doing it later in a FutureBuilder
  // rebuild can throw "Deferred library <x> was not loaded" synchronously
  // during build (crashing the frame). Routing the access through this Future
  // turns any such failure into a normal FutureBuilder error we can recover
  // from below.
  Future<Widget> _load() async {
    await widget.loader();
    return widget.builder();
  }

  void _retry() => setState(() => _page = _load());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _page,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: AppLoader());
        }
        if (snapshot.hasError) {
          // A stale-deploy chunk 404 is fixed by a single hard reload; the
          // sessionStorage guard inside the helper prevents a reload loop.
          if (tryReloadOnceForStaleChunk('deferred_reload_${widget.routeKey}')) {
            return const Center(child: AppLoader());
          }
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.t.common.pageNotFound),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: _retry,
                  icon: const Icon(Icons.refresh),
                  label: Text(context.t.common.retry),
                ),
              ],
            ),
          );
        }
        return snapshot.data!;
      },
    );
  }
}
