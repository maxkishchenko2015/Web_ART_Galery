import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web_art_galery/src/shared/config/app_palette.dart';

/// Where the active site config came from.
enum AppConfigSource {
  /// Fetched from Firebase Remote Config.
  remote,

  /// Bundled `assets/config/remote_config_fallback.json` (Remote Config
  /// unavailable, failed, or not fetched yet).
  fallback,
}

/// Remote Config parameter names (string params holding JSON).
abstract final class RemoteConfigKeys {
  const RemoteConfigKeys._();

  /// `["BL"]` — BL = blue (night), GR = green (parchment), WH = white (classic).
  static const String appTheme = 'APP_THEME';

  /// `[{"title": "...", "url": "..."}]` — third-party news to announce.
  static const String mainNews = 'MAIN_NEWS';

  /// `["1965.2", "1981.1"]` — catalog ids for the home "Selected works".
  static const String mainPicturesIds = 'MAIN_PICTURES_IDS';

  static const List<String> all = [appTheme, mainNews, mainPicturesIds];
}

/// A third-party publication announced on the home page.
@immutable
class Announcement {
  const Announcement({required this.title, required this.url, this.description, this.date});

  /// Headline / publication name ("THE PARIS REVIEW").
  final String title;
  final String url;

  /// Optional teaser text.
  final String? description;

  /// Optional publication date (ISO-8601 in the config).
  final DateTime? date;

  /// Publisher domain without `www.` — "theparisreview.org".
  String get host {
    final host = Uri.tryParse(url)?.host ?? '';
    return host.startsWith('www.') ? host.substring(4) : host;
  }

  /// Instagram post — titled `INSTAGRAM_01`, `INSTAGRAM_02` … in the config,
  /// or simply linking to instagram.com.
  bool get isInstagram =>
      title.toUpperCase().startsWith('INSTAGRAM') || host.endsWith('instagram.com');

  /// Instagram short video (`/reel/` link).
  bool get isReel => isInstagram && url.contains('/reel/');

  /// Title to show: the `INSTAGRAM_nn` placeholder becomes "Instagram".
  String get displayTitle => isInstagram ? 'Instagram' : title;

  static Announcement? fromJson(Object? json) {
    if (json is! Map) return null;
    final title = (json['title'] as Object?)?.toString().trim() ?? '';
    final url = (json['url'] as Object?)?.toString().trim() ?? '';
    final uri = Uri.tryParse(url);
    if (title.isEmpty || uri == null || !uri.hasScheme || uri.host.isEmpty) return null;
    final description = (json['description'] ?? json['subtitle'] ?? json['text'])
        ?.toString()
        .trim();
    final date = DateTime.tryParse((json['date'] ?? '').toString());
    return Announcement(
      title: title,
      url: url,
      description: (description == null || description.isEmpty) ? null : description,
      date: date,
    );
  }

  Map<String, Object?> toJson() => {
    'title': title,
    'url': url,
    'description': ?description,
    'date': ?date?.toIso8601String(),
  };
}

/// Site configuration driven by Remote Config: default theme, the home
/// page's featured paintings and third-party news announcements.
@immutable
class AppRemoteConfig {
  const AppRemoteConfig({
    required this.themeCode,
    required this.pictureIds,
    required this.announcements,
    required this.source,
  });

  /// Used only if even the bundled fallback can't be read.
  static const AppRemoteConfig builtIn = AppRemoteConfig(
    themeCode: 'BL',
    pictureIds: ['1965.2', '1981.1', '1997.5'],
    announcements: [],
    source: AppConfigSource.fallback,
  );

  /// Raw theme code from `APP_THEME` ("BL" / "GR" / "WH").
  final String themeCode;

  /// Sorted, de-duplicated catalog ids.
  final List<String> pictureIds;
  final List<Announcement> announcements;
  final AppConfigSource source;

  AppPalette get palette => switch (themeCode) {
    'GR' => AppPalette.parchment,
    'WH' => AppPalette.classic,
    _ => AppPalette.night, // 'BL' and anything unknown → blue
  };

  /// Builds a config from decoded JSON values keyed by [RemoteConfigKeys];
  /// any missing or malformed value falls back to [defaults].
  static AppRemoteConfig fromValues(
    Map<String, Object?> values, {
    required AppConfigSource source,
    AppRemoteConfig defaults = builtIn,
  }) {
    final theme = _firstString(values[RemoteConfigKeys.appTheme]);
    final ids = _stringList(values[RemoteConfigKeys.mainPicturesIds]);
    final newsRaw = values[RemoteConfigKeys.mainNews];
    final news = newsRaw is List
        ? newsRaw.map(Announcement.fromJson).whereType<Announcement>().toList(growable: false)
        : null;

    return AppRemoteConfig(
      themeCode: theme ?? defaults.themeCode,
      pictureIds: ids ?? defaults.pictureIds,
      announcements: news ?? defaults.announcements,
      source: source,
    );
  }

  /// Decodes a Remote Config string value ("[\"BL\"]") to JSON, or null.
  static Object? decode(String raw) {
    if (raw.trim().isEmpty) return null;
    try {
      return jsonDecode(raw);
    } on FormatException {
      return raw.trim(); // plain "BL" is accepted too
    }
  }

  /// Values as Remote Config default strings (JSON-encoded).
  Map<String, String> toRemoteDefaults() => {
    RemoteConfigKeys.appTheme: jsonEncode([themeCode]),
    RemoteConfigKeys.mainPicturesIds: jsonEncode(pictureIds),
    RemoteConfigKeys.mainNews: jsonEncode([for (final a in announcements) a.toJson()]),
  };

  static String? _firstString(Object? value) {
    final raw = value is List ? (value.isEmpty ? null : value.first) : value;
    final code = raw?.toString().trim().toUpperCase();
    return (code == null || code.isEmpty) ? null : code;
  }

  static List<String>? _stringList(Object? value) {
    if (value is! List) return null;
    final ids = value.map((e) => e.toString().trim()).where((e) => e.isNotEmpty).toSet().toList()
      ..sort();
    return ids.isEmpty ? null : ids;
  }

  @override
  bool operator ==(Object other) =>
      other is AppRemoteConfig &&
      other.source == source &&
      jsonEncode(other.toRemoteDefaults()) == jsonEncode(toRemoteDefaults());

  @override
  int get hashCode => Object.hash(source, jsonEncode(toRemoteDefaults()));
}
