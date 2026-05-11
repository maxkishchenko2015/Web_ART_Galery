import 'package:web_art_galery/src/features/news/data/models/news_firebase_object.dart';
import 'package:web_art_galery/src/features/news/data/models/news_translation_firebase_object.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_translation.dart';

extension NewsFirebaseObjectX on NewsFirebaseObject {
  NewsArticle toDomain() => NewsArticle(
    id: id,
    name: name,
    publishedAt: publishedAt,
    imageUrls: imageUrls,
    sourceUrl: sourceUrl,
    translations: <String, NewsTranslation>{
      for (final entry in translations.entries) entry.key: entry.value.toDomain(),
    },
  );
}

extension NewsTranslationFirebaseObjectX on NewsTranslationFirebaseObject {
  NewsTranslation toDomain() => NewsTranslation(
    title: title,
    excerpt: excerpt,
    body: body,
  );
}
