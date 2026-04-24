import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// One-shot uploader that bootstraps the `news` Firestore collection with a
/// handful of template documents. Firestore auto-creates the collection on
/// first write — after this runs once the "news" collection shows up in the
/// Firebase Console and the app can fetch from it.
///
/// Intended workflow:
/// 1. Run `flutter run -t lib/main_news_seed.dart` once.
/// 2. Open Firebase Console and edit titles / translations on the generated
///    documents.
///
/// Each invocation appends new auto-id documents, so only re-run the entry
/// point when you actually want more templates.
class AdminNewsSeedFlow {
  AdminNewsSeedFlow({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  /// Uploads placeholder documents. Safe to re-run — each call creates a new
  /// auto-id document, so running twice will duplicate templates. The feature
  /// flag in the caller is expected to prevent that.
  Future<void> seedTemplates() async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }

    final collectionRef = _firestore.collection(FirestoreCollections.news);

    for (final template in _templates) {
      final docRef = await collectionRef.add(<String, dynamic>{
        FirestoreCollections.newsPublishedAtField: FieldValue.serverTimestamp(),
        if (template.imageUrls.isNotEmpty)
          FirestoreCollections.newsImageUrlsField: template.imageUrls,
        if (template.sourceUrl != null) FirestoreCollections.newsSourceUrlField: template.sourceUrl,
        FirestoreCollections.newsTranslationsField: _translationsPayload(template),
      });

      // Mirror the auto-id back into the document so clients can rely on
      // either the doc id or the `id` field interchangeably.
      await docRef.update(<String, dynamic>{FirestoreCollections.newsIdField: docRef.id});

      AppLogger.instance.i('News seed: wrote template "${template.ruTitle}" -> ${docRef.id}');
    }

    AppLogger.instance.i('News seed finished: ${_templates.length} templates uploaded.');
  }

  Map<String, dynamic> _translationsPayload(_NewsTemplate template) {
    // Only Russian placeholders are populated; remaining locales are written
    // with empty strings so editors can fill them in from the Firebase
    // Console without changing the document shape. Absent values fall back
    // to `ru` at runtime via `NewsArticle.fallbackLocale`.
    return <String, dynamic>{
      'ru': _localeEntry(template.ruTitle, template.ruExcerpt, template.ruBody),
      'en': _localeEntry('', '', ''),
      'be': _localeEntry('', '', ''),
      'de': _localeEntry('', '', ''),
      'es': _localeEntry('', '', ''),
      'fr': _localeEntry('', '', ''),
    };
  }

  Map<String, dynamic> _localeEntry(String title, String excerpt, String body) {
    return <String, dynamic>{
      FirestoreCollections.newsTitleField: title,
      FirestoreCollections.newsExcerptField: excerpt,
      FirestoreCollections.newsBodyField: body,
    };
  }

  static const List<_NewsTemplate> _templates = <_NewsTemplate>[
    _NewsTemplate(
      ruTitle: '[Шаблон] Заголовок первой новости',
      ruExcerpt:
          'Короткий анонс из 2–3 предложений — именно этот текст видно на карточке в ленте новостей.',
      ruBody:
          'Полный текст статьи. Можно писать несколько абзацев — используйте пустую строку между абзацами, '
          'и она автоматически превратится в разделитель на странице статьи.\n\n'
          'Второй абзац: фактура, детали, цитаты, ссылки. Редактируйте этот документ напрямую в Firebase '
          'Console после первого сида.',
    ),
    _NewsTemplate(
      ruTitle: '[Шаблон] Заголовок второй новости',
      ruExcerpt: 'Ещё один пример карточки. Замените этот текст на реальный анонс публикации.',
      ruBody:
          'Тело второй статьи — используется как заготовка. Удалите шаблон, когда добавите первую '
          'настоящую новость.',
      // Sample fields: replace with real URLs in Firebase Console (or leave
      // empty). They are written so Console editors see the full document
      // shape.
      imageUrls: ['https://via.placeholder.com/150', 'https://via.placeholder.com/150'],
      sourceUrl: '',
    ),
  ];
}

class _NewsTemplate {
  const _NewsTemplate({
    required this.ruTitle,
    required this.ruExcerpt,
    required this.ruBody,
    this.imageUrls = const [],
    this.sourceUrl,
  });

  final String ruTitle;
  final String ruExcerpt;
  final String ruBody;
  final List<String> imageUrls;
  final String? sourceUrl;
}
