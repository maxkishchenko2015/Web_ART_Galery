/// Single source of truth for app navigation paths.
///
/// Every `context.go(...)`, `GoRoute(path: ...)`, and shell-menu entry should
/// reference these constants so route literals never drift between the router
/// definition and the call sites that drive navigation.
abstract final class AppRoutes {
  const AppRoutes._();

  static const String aboutAuthor = '/about-author';
  static const String news = '/news';
  static const String catalog = '/catalog';
  static const String films = '/films';
  static const String archive = '/archive';
  static const String contacts = '/contacts';

  /// Sub-route segments mounted under [news] and [catalog]. Kept as bare
  /// segments (no leading `/`) so they compose cleanly with the parent path.
  static const String newsArticleSegment = ':articleId';
  static const String catalogWorkSegment = ':workId';

  /// Path-parameter keys exposed by [GoRouterState.pathParameters].
  static const String articleIdParam = 'articleId';
  static const String workIdParam = 'workId';
}
