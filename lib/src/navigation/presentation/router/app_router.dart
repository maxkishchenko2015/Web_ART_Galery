import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/presentation/screens/about_author_page.dart';
import 'package:web_art_galery/src/features/archive/presentation/screens/archive_page.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/screens/catalog_of_works_page.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/screens/catalog_work_detail_page.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page.dart';
import 'package:web_art_galery/src/features/news/presentation/screens/news_page.dart';
import 'package:web_art_galery/src/navigation/presentation/screens/app_shell_page.dart';
import 'package:web_art_galery/src/shared/presentation/screens/placeholder_page.dart';

final appRouter = GoRouter(
  initialLocation: '/about-author',
  redirect: (context, state) {
    if (state.uri.path == '/') {
      return '/about-author';
    }

    return null;
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShellPage(child: child),
      routes: [
        GoRoute(path: '/about-author', builder: (context, state) => const AboutAuthorPage()),
        GoRoute(path: '/news', builder: (context, state) => const NewsPage()),
        GoRoute(
          path: '/catalog',
          builder: (context, state) => const CatalogOfWorksPage(),
          routes: [
            // Placeholder branch for future nested catalog routes.
            GoRoute(
              path: ':workId',
              builder: (context, state) =>
                  CatalogWorkDetailPage(workId: state.pathParameters['workId'] ?? 'unknown'),
            ),
          ],
        ),
        GoRoute(path: '/archive', builder: (context, state) => const ArchivePage()),
        GoRoute(path: '/contacts', builder: (context, state) => const ContactsPage()),
      ],
    ),
  ],
  errorBuilder: (context, state) =>
      AppShellPage(child: PlaceholderPage(title: context.t.common.pageNotFound)),
);
