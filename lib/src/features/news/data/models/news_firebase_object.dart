import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_art_galery/src/features/news/data/models/news_translation_firebase_object.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

/// DTO mirroring the `news/{autoId}` document shape.
class NewsFirebaseObject {
  const NewsFirebaseObject({
    required this.id,
    required this.translations,
    required this.imageUrls,
    this.publishedAt,
    this.sourceUrl,
  });

  factory NewsFirebaseObject.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final data = snapshot.data() ?? const <String, dynamic>{};

    final rawTranslations =
        (data[FirestoreCollections.newsTranslationsField] as Map?) ??
        const <dynamic, dynamic>{};

    final translations = <String, NewsTranslationFirebaseObject>{};
    rawTranslations.forEach((key, value) {
      if (key is! String || value is! Map) return;
      final localeCode = key.trim().toLowerCase();
      if (localeCode.isEmpty) return;
      translations[localeCode] = NewsTranslationFirebaseObject.fromMap(
        Map<String, dynamic>.from(value),
      );
    });

    final rawPublishedAt = data[FirestoreCollections.newsPublishedAtField];
    final publishedAt = rawPublishedAt is Timestamp ? rawPublishedAt.toDate() : null;

    // Prefer the stored `id` field but fall back to the Firestore document id
    // so we tolerate rows written without the roundtrip `update({id: docRef.id})`.
    final storedId = (data[FirestoreCollections.newsIdField] as String?)?.trim();
    final resolvedId = (storedId == null || storedId.isEmpty) ? snapshot.id : storedId;

    final rawImageUrls = data[FirestoreCollections.newsImageUrlsField];
    final imageUrls = <String>[];
    if (rawImageUrls is List) {
      for (final item in rawImageUrls) {
        final url = (item as String?)?.trim() ?? '';
        if (url.isNotEmpty) imageUrls.add(url);
      }
    }

    return NewsFirebaseObject(
      id: resolvedId,
      publishedAt: publishedAt,
      imageUrls: imageUrls,
      sourceUrl: (data[FirestoreCollections.newsSourceUrlField] as String?)?.trim(),
      translations: translations,
    );
  }

  final String id;
  final DateTime? publishedAt;
  final List<String> imageUrls;
  final String? sourceUrl;
  final Map<String, NewsTranslationFirebaseObject> translations;

  Map<String, dynamic> toFirestore() => <String, dynamic>{
    FirestoreCollections.newsIdField: id,
    if (publishedAt != null)
      FirestoreCollections.newsPublishedAtField: Timestamp.fromDate(publishedAt!),
    if (imageUrls.isNotEmpty) FirestoreCollections.newsImageUrlsField: imageUrls,
    if (sourceUrl != null) FirestoreCollections.newsSourceUrlField: sourceUrl,
    FirestoreCollections.newsTranslationsField: <String, dynamic>{
      for (final entry in translations.entries) entry.key: entry.value.toMap(),
    },
  };
}
