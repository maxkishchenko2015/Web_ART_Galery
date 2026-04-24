import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';

abstract class NewsRepository {
  /// Returns every published article, ordered by `publishedAt desc`.
  ///
  /// Articles without a `publishedAt` timestamp are pushed to the bottom
  /// (they are treated as unpublished drafts that still need a date).
  Future<List<NewsArticle>> fetchAll();

  /// Returns a single article by its Firestore document id, or `null` when
  /// the document does not exist.
  Future<NewsArticle?> fetchById(String id);
}
