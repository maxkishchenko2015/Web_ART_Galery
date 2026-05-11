/// Maps a navigation URL path to a stable screen name suitable for analytics.
///
/// Keeping the mapping centralized lets us bind GA4 `screen_view` events to a
/// finite, well-known set of dimensions instead of leaking raw URL paths
/// (which include dynamic IDs and would explode the cardinality).
class ScreenNameResolver {
  const ScreenNameResolver._();

  /// Returns a screen name and an optional item identifier for detail pages.
  ///
  /// [itemId] is non-null for `/news/:slug` and `/catalog/:workId` so the
  /// analytics event can carry which specific article or artwork was viewed.
  static ({String name, String? itemId}) resolve(String path) {
    final segments = path.split('/').where((s) => s.isNotEmpty).toList();
    if (segments.isEmpty) {
      return (name: 'about_author', itemId: null);
    }
    final root = segments.first;
    switch (root) {
      case 'about-author':
        return (name: 'about_author', itemId: null);
      case 'news':
        return segments.length > 1
            ? (name: 'news_detail', itemId: segments[1])
            : (name: 'news', itemId: null);
      case 'catalog':
        return segments.length > 1
            ? (name: 'catalog_detail', itemId: segments[1])
            : (name: 'catalog', itemId: null);
      case 'films':
        return (name: 'films', itemId: null);
      case 'archive':
        return (name: 'archive', itemId: null);
      case 'contacts':
        return (name: 'contacts', itemId: null);
      default:
        return (name: 'unknown', itemId: null);
    }
  }

  /// Convenience wrapper returning only the screen name.
  static String fromPath(String path) => resolve(path).name;
}
