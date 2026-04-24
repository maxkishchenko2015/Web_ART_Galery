import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_translation.dart';

/// Domain-level representation of a single Firestore news document.
///
/// Localized copy lives in [translations], keyed by the slang
/// [AppLocale.languageCode]. Use [titleFor] / [excerptFor] / [bodyFor]
/// to resolve text for the active locale with the repository-wide
/// base-locale fallback applied.
class NewsArticle {
  const NewsArticle({
    required this.id,
    required this.translations,
    required this.imageUrls,
    this.publishedAt,
    this.sourceUrl,
  });

  final String id;
  final DateTime? publishedAt;
  final List<String> imageUrls;
  final String? sourceUrl;

  /// Map of locale language codes (`ru`, `en`, `be`, `de`, `es`, `fr`) to
  /// their respective [NewsTranslation]. Any locale may be missing — we
  /// fall back to [fallbackLocale] transparently.
  final Map<String, NewsTranslation> translations;

  /// Matches `base_locale: ru` in [slang.yaml].
  static const AppLocale fallbackLocale = AppLocale.ru;

  String titleFor(AppLocale locale) => _resolve(locale, (t) => t.title);

  String excerptFor(AppLocale locale) => _resolve(locale, (t) => t.excerpt);

  String bodyFor(AppLocale locale) => _resolve(locale, (t) => t.body);

  bool get hasImage => imageUrls.isNotEmpty;

  bool get hasSourceUrl => (sourceUrl ?? '').trim().isNotEmpty;

  String _resolve(AppLocale locale, String Function(NewsTranslation) read) {
    final primary = translations[locale.languageCode];
    if (primary != null) {
      final value = read(primary).trim();
      if (value.isNotEmpty) return value;
    }

    final fallback = translations[fallbackLocale.languageCode];
    if (fallback != null) {
      return read(fallback).trim();
    }

    return '';
  }
}
