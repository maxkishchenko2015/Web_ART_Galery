import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// Typed product-analytics events (Firebase Analytics + Mixpanel via
/// [AppTelemetry]). Keep names stable — reports are built on them.
///
/// | event                 | when                                            |
/// |-----------------------|-------------------------------------------------|
/// | `cta_clicked`         | any in-page navigation button / link / tile     |
/// | `news_article_opened` | a news article opened (list, home story)        |
/// | `archive_item_opened` | an archive publication opened (external)        |
/// | `archive_searched`    | archive search settled (length + result count)  |
/// | `archive_filtered`    | archive year filter changed                     |
/// | `contact_clicked`     | phone / social / map link tapped                |
/// | `language_changed`    | UI language switched                            |
///
/// Logged elsewhere: `theme_shown`, `palette_changed` (AppPaletteCubit),
/// `remote_config_applied` (AppConfigCubit), `announcements_shown` /
/// `announcement_opened` (home announcements), `gallery_image_opened`
/// (paintings), `films_card_opened` (films), screen views (router).
abstract final class AnalyticsEvents {
  const AnalyticsEvents._();

  /// [origin] — where on the page (`home_hero`, `footer` …); [target] —
  /// where it leads (`catalog`, `/films`, `biography` …).
  static void cta({required String origin, required String target}) =>
      AppTelemetry.instance.logEvent('cta_clicked', params: {'origin': origin, 'target': target});

  static void newsArticleOpened({
    required String articleId,
    required String origin,
    int? position,
  }) => AppTelemetry.instance.logEvent(
    'news_article_opened',
    params: {'article_id': articleId, 'origin': origin, 'position': ?position},
  );

  static void archiveItemOpened({
    required String key,
    required String host,
    required int year,
    required String origin,
  }) => AppTelemetry.instance.logEvent(
    'archive_item_opened',
    params: {'item_key': key, 'host': host, 'year': year, 'origin': origin},
  );

  /// The query text itself isn't sent — only its length and the outcome.
  static void archiveSearched({required int queryLength, required int results}) => AppTelemetry
      .instance
      .logEvent('archive_searched', params: {'query_length': queryLength, 'results': results});

  static void archiveFiltered({required int? year}) =>
      AppTelemetry.instance.logEvent('archive_filtered', params: {'year': year ?? 'all'});

  /// [channel] — `phone`, `instagram`, `vk`, `map`.
  static void contactClicked({required String channel, required String origin}) => AppTelemetry
      .instance
      .logEvent('contact_clicked', params: {'channel': channel, 'origin': origin});

  static void languageChanged({required String from, required String to}) {
    AppTelemetry.instance.logEvent('language_changed', params: {'from': from, 'to': to});
    AppTelemetry.instance.setUserProperty('app_locale', to);
  }
}
