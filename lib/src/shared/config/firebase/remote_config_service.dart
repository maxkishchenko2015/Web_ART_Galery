import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Thin facade over Firebase Remote Config. Fetches once at startup and exposes
/// the flags the app reads. When Firebase isn't configured or the fetch fails,
/// every flag falls back to its default — mirroring the [AppTelemetry] /
/// `FirebaseBootstrap` no-op-on-failure pattern.
class RemoteConfigService {
  RemoteConfigService._();

  static final RemoteConfigService _instance = RemoteConfigService._();

  static RemoteConfigService get instance => _instance;

  /// RC flag gating the first-visit tooltips (onboarding tour).
  static const String _showTooltipsKey = 'SHOW_TOOLTIPS';

  FirebaseRemoteConfig? _remoteConfig;

  /// Whether the onboarding tooltips should be shown. Defaults to false until a
  /// successful fetch says otherwise.
  bool get showTooltips => _remoteConfig?.getBool(_showTooltipsKey) ?? false;

  /// Fetches and activates remote config. No-op when Firebase isn't ready.
  /// Never throws — fetch failures are logged and tracked, flags stay at their
  /// defaults.
  Future<void> initialize() async {
    if (Firebase.apps.isEmpty) {
      return;
    }
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setDefaults(const {_showTooltipsKey: false});
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(hours: 1),
        ),
      );
      await remoteConfig.fetchAndActivate();
      _remoteConfig = remoteConfig;
    } catch (error, stackTrace) {
      AppLogger.instance.e('RemoteConfig fetch failed', error: error, stackTrace: stackTrace);
      AppTelemetry.instance.logFirebaseError(error, stackTrace, reason: 'remote_config_fetch');
    }
  }
}
