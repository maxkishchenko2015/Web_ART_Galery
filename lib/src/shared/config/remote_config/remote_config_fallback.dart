import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:web_art_galery/src/shared/config/remote_config/app_remote_config.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Reads the bundled `assets/config/remote_config_fallback.json` — the site
/// config used until (or instead of, when it fails) Remote Config arrives.
/// Same keys as Remote Config; values are plain JSON there.
abstract final class RemoteConfigFallback {
  const RemoteConfigFallback._();

  static const String assetPath = 'assets/config/remote_config_fallback.json';

  /// Never throws: an unreadable asset yields [AppRemoteConfig.builtIn].
  static Future<AppRemoteConfig> load() async {
    try {
      final raw = await rootBundle.loadString(assetPath);
      final json = jsonDecode(raw);
      if (json is! Map<String, dynamic>) return AppRemoteConfig.builtIn;
      return AppRemoteConfig.fromValues(json, source: AppConfigSource.fallback);
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'Remote config fallback unreadable',
        error: error,
        stackTrace: stackTrace,
      );
      return AppRemoteConfig.builtIn;
    }
  }
}
