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
  ///
  /// The news segment is named `articleSlug` because the value can be either
  /// a URL-safe slug (Firestore `name` field, preferred) or the raw
  /// document id (legacy fallback). The repository resolves both.
  static const String newsArticleSegment = ':articleSlug';
  static const String catalogWorkSegment = ':workId';

  /// Path-parameter keys exposed by [GoRouterState.pathParameters].
  static const String articleSlugParam = 'articleSlug';
  static const String workIdParam = 'workId';
}
