import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Token can be overridden at build time via --dart-define=MIXPANEL_TOKEN=...
const String _kMixpanelToken = String.fromEnvironment(
  'MIXPANEL_TOKEN',
  defaultValue: '693d000f589543ae84cad2a2543fdca7',
);

/// Thin bridge to the Mixpanel Flutter SDK.
///
/// All public methods mirror [AppTelemetry]'s API so the two can be driven
/// in lock-step. Super properties are used in place of People profile
/// properties because the app has no user login / [Mixpanel.identify] call.
class MixpanelBridge {
  MixpanelBridge._();

  static final MixpanelBridge instance = MixpanelBridge._();

  Mixpanel? _mixpanel;

  bool get _enabled => _mixpanel != null;

  /// Initialises the Mixpanel SDK. Safe to call multiple times — subsequent
  /// calls are no-ops once the instance is created.
  Future<void> initialize() async {
    if (_enabled) return;
    if (_kMixpanelToken.isEmpty) return;
    try {
      _mixpanel = await Mixpanel.init(
        _kMixpanelToken,
        trackAutomaticEvents: false,
      );
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'MixpanelBridge initialize failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Records a virtual screen/page view.
  void logScreenView(String screenName) {
    if (!_enabled) return;
    try {
      _mixpanel!.track('screen_view', properties: {'screen_name': screenName});
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'MixpanelBridge logScreenView failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Tracks a named event with optional properties.
  void logEvent(String name, {Map<String, Object?>? params}) {
    if (!_enabled) return;
    try {
      final properties = _toStringMap(params);
      _mixpanel!.track(name, properties: properties);
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'MixpanelBridge logEvent failed ($name)',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Registers a global super property so every future event carries it.
  /// Maps to [AppTelemetry.setUserProperty] — super properties are preferred
  /// over People profiles since there is no authenticated user identity.
  void setUserProperty(String name, String? value) {
    if (!_enabled) return;
    try {
      _mixpanel!.registerSuperProperties({name: value ?? ''});
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'MixpanelBridge setUserProperty failed ($name)',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Mixpanel's [track] accepts [Map<String, dynamic>] but the app uses
  /// [Map<String, Object?>] — this converts and drops null values.
  Map<String, dynamic>? _toStringMap(Map<String, Object?>? params) {
    if (params == null || params.isEmpty) return null;
    final result = <String, dynamic>{};
    params.forEach((key, value) {
      if (value != null) result[key] = value;
    });
    return result.isEmpty ? null : result;
  }
}
