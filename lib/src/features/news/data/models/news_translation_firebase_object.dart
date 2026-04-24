import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

/// Locale sub-map inside `news/{id}.translations.<lang>`.
class NewsTranslationFirebaseObject {
  const NewsTranslationFirebaseObject({
    this.title = '',
    this.excerpt = '',
    this.body = '',
  });

  factory NewsTranslationFirebaseObject.fromMap(Map<String, dynamic> data) {
    return NewsTranslationFirebaseObject(
      title: (data[FirestoreCollections.newsTitleField] as String?)?.trim() ?? '',
      excerpt: (data[FirestoreCollections.newsExcerptField] as String?)?.trim() ?? '',
      body: (data[FirestoreCollections.newsBodyField] as String?) ?? '',
    );
  }

  final String title;
  final String excerpt;
  final String body;

  Map<String, dynamic> toMap() => <String, dynamic>{
    FirestoreCollections.newsTitleField: title,
    FirestoreCollections.newsExcerptField: excerpt,
    FirestoreCollections.newsBodyField: body,
  };
}
