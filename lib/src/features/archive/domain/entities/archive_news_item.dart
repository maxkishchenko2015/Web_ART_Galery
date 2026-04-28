import 'package:flutter/material.dart';
import 'package:web_art_galery/i18n/strings.g.dart';

/// A single archive (press / publication) entry rendered as a card on the
/// Archive page.
///
/// The entry carries a stable [key] used both for analytics events and for
/// resolving localized copy via the slang
/// `archiveFeed.items.[key].{title, excerpt}` path.
@immutable
class ArchiveNewsItem {
  const ArchiveNewsItem({
    required this.key,
    required this.url,
    required this.date,
    required this.host,
    required this.accent,
    required this.accentSecondary,
  });

  /// Stable key used for analytics and slang i18n lookups.
  final String key;

  /// Public URL of the source publication.
  final String url;

  /// Publication date — used for sorting (newest first) and for the year
  /// label rendered on the card thumbnail.
  final DateTime date;

  /// Display label of the publication host (e.g. `priorbank.by`).
  final String host;

  /// Gradient end-stops used as the card thumbnail backdrop.
  final Color accent;
  final Color accentSecondary;

  /// Localized title resolved against `archiveFeed.items.<key>.title`.
  /// Falls back to [key] when the translation is missing.
  String localizedTitle(Translations t) {
    final path = 'archiveFeed.items.$key.title';
    final value = t[path];
    if (value is String && value != path) {
      return value;
    }
    return key;
  }

  /// Localized excerpt resolved against `archiveFeed.items.<key>.excerpt`.
  /// Falls back to an empty string when the translation is missing.
  String localizedExcerpt(Translations t) {
    final path = 'archiveFeed.items.$key.excerpt';
    final value = t[path];
    if (value is String && value != path) {
      return value;
    }
    return '';
  }
}
