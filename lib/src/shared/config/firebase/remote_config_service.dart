import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:web_art_galery/src/shared/config/remote_config/app_remote_config.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Thin facade over Firebase Remote Config. Fetches once at startup and exposes
/// the values the app reads. When Firebase isn't configured or the fetch fails,
/// every value falls back to its default — mirroring the [AppTelemetry] /
/// `FirebaseBootstrap` no-op-on-failure pattern.
class RemoteConfigService {
  RemoteConfigService._();

  static final RemoteConfigService _instance = RemoteConfigService._();

  static RemoteConfigService get instance => _instance;

  FirebaseRemoteConfig? _remoteConfig;

  /// Reads boolean flag [key]; returns [fallback] until a successful fetch
  /// (or when Firebase isn't available).
  bool getBool(String key, {bool fallback = false}) {
    final remoteConfig = _remoteConfig;
    if (remoteConfig == null) return fallback;
    final value = remoteConfig.getValue(key);
    return value.source == ValueSource.valueStatic ? fallback : value.asBool();
  }

  /// Fetches and activates remote config, with [defaults] (string values,
  /// e.g. the bundled fallback) for keys the server doesn't deliver. Returns
  /// whether Remote Config is usable. Never throws — failures are logged and
  /// tracked.
  Future<bool> initialize({Map<String, String> defaults = const {}}) async {
    if (Firebase.apps.isEmpty) {
      return false;
    }
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      if (defaults.isNotEmpty) {
        await remoteConfig.setDefaults(defaults);
      }
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(hours: 1),
        ),
      );
      await remoteConfig.fetchAndActivate();
      _remoteConfig = remoteConfig;
      return true;
    } catch (error, stackTrace) {
      AppLogger.instance.e('RemoteConfig fetch failed', error: error, stackTrace: stackTrace);
      AppTelemetry.instance.logFirebaseError(error, stackTrace, reason: 'remote_config_fetch');
      return false;
    }
  }

  /// The site config from the activated Remote Config values; keys that came
  /// back empty or malformed use [fallback]. The result is tagged
  /// [AppConfigSource.remote] only when at least one key came from the server
  /// (not from defaults). Null before a successful [initialize].
  AppRemoteConfig? readConfig({required AppRemoteConfig fallback}) {
    final remoteConfig = _remoteConfig;
    if (remoteConfig == null) return null;

    var anyRemote = false;
    final values = <String, Object?>{};
    for (final key in RemoteConfigKeys.all) {
      final value = remoteConfig.getValue(key);
      if (value.source == ValueSource.valueRemote) anyRemote = true;
      values[key] = AppRemoteConfig.decode(value.asString());
    }
    return AppRemoteConfig.fromValues(
      values,
      source: anyRemote ? AppConfigSource.remote : AppConfigSource.fallback,
      defaults: fallback,
    );
  }
}
