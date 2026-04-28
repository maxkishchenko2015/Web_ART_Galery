/// Maps a navigation URL path to a stable screen name suitable for analytics.
///
/// Keeping the mapping centralized lets us bind GA4 `screen_view` events to a
/// finite, well-known set of dimensions instead of leaking raw URL paths
/// (which include dynamic IDs and would explode the cardinality).
class ScreenNameResolver {
  const ScreenNameResolver._();

  static String fromPath(String path) {
    final segments = path.split('/').where((s) => s.isNotEmpty).toList();
    if (segments.isEmpty) {
      return 'about_author';
    }
    final root = segments.first;
    switch (root) {
      case 'about-author':
        return 'about_author';
      case 'news':
        return segments.length > 1 ? 'news_detail' : 'news';
      case 'catalog':
        return segments.length > 1 ? 'catalog_detail' : 'catalog';
      case 'archive':
        return 'archive';
      case 'contacts':
        return 'contacts';
      default:
        return 'unknown';
    }
  }
}
