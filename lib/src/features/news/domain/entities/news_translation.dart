/// Locale-scoped copy of a single news article.
///
/// Any field may be empty when only a subset of the UI copy has been
/// translated; callers rely on [NewsArticle.titleFor]/[bodyFor] fallbacks
/// rather than reading this object directly.
class NewsTranslation {
  const NewsTranslation({this.title = '', this.excerpt = '', this.body = ''});

  final String title;
  final String excerpt;
  final String body;

  bool get isEmpty => title.isEmpty && excerpt.isEmpty && body.isEmpty;

  @override
  String toString() =>
      'NewsTranslation{title: $title, excerpt: $excerpt, body: ${body.length} chars}';
}
