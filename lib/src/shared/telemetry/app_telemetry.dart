import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Thin facade over [FirebaseAnalytics] used as the single point of telemetry
/// emission across the app. All methods become no-ops when Firebase is not
/// configured (CI / local dev without env vars), mirroring the existing
/// `FirebaseBootstrap.tryInitialize` pattern.
class AppTelemetry {
  AppTelemetry._();

  static final AppTelemetry _instance = AppTelemetry._();

  static AppTelemetry get instance => _instance;

  bool _enabled = false;
  FirebaseAnalytics? _analytics;
  String? _lastScreenName;

  /// Hooks Firebase Analytics if Firebase has been initialized. Safe to call
  /// multiple times; subsequent calls become no-ops once enabled.
  Future<void> initialize() async {
    if (_enabled) {
      return;
    }
    if (Firebase.apps.isEmpty) {
      return;
    }
    try {
      _analytics = FirebaseAnalytics.instance;
      await _analytics!.setAnalyticsCollectionEnabled(true);
      _enabled = true;
    } catch (error, stackTrace) {
      AppLogger.instance.e('AppTelemetry initialize failed', error: error, stackTrace: stackTrace);
    }
  }

  Future<void> logScreenView({required String screenName}) async {
    if (!_enabled || _analytics == null) {
      return;
    }
    if (_lastScreenName == screenName) {
      return;
    }
    _lastScreenName = screenName;
    try {
      await _analytics!.logScreenView(screenName: screenName);
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'AppTelemetry logScreenView failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> logEvent(String name, {Map<String, Object?>? params}) async {
    if (!_enabled || _analytics == null) {
      return;
    }
    try {
      await _analytics!.logEvent(name: name, parameters: _sanitizeParams(params));
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'AppTelemetry logEvent failed ($name)',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Generic catch-all for Flutter framework / Zone errors that aren't
  /// classified as Firebase or HydratedBloc.
  Future<void> logFatal(
    Object error,
    StackTrace? stack, {
    String? reason,
    bool fatal = true,
  }) => _emitError(_fatalEventName, error, stack, reason: reason, fatal: fatal);

  /// Firebase initialisation or operation failure.
  Future<void> logFirebaseError(Object error, StackTrace? stack, {String? reason}) =>
      _emitError(_firebaseErrorEventName, error, stack, reason: reason, fatal: false);

  /// Firestore collection loaded successfully but returned zero documents.
  Future<void> logEmptyContent({required String source}) =>
      logEvent(_emptyContentEventName, params: {'source': source});

  /// HydratedBloc local persistence failure (typically iOS Safari refusing
  /// IndexedDB under ITP / private mode / blocked cookies).
  Future<void> logHydratedBlocError(Object error, StackTrace? stack, {String? reason}) =>
      _emitError(_hydratedBlocErrorEventName, error, stack, reason: reason, fatal: false);

  Future<void> _emitError(
    String eventName,
    Object error,
    StackTrace? stack, {
    String? reason,
    required bool fatal,
  }) async {
    if (!_enabled || _analytics == null) {
      return;
    }
    if (_isIgnorableError(error)) {
      return;
    }
    try {
      final params = <String, Object>{
        'fatal': fatal ? 1 : 0,
        'error_type': error.runtimeType.toString(),
        'message': _truncate(error.toString(), 100),
        'stack_trace_top': _truncate(_topStackFrames(stack, 5), 100),
      };
      if (reason != null && reason.isNotEmpty) {
        params['reason'] = _truncate(reason, 100);
      }
      // 'app_exception' is a reserved Firebase Analytics event name (the SDK
      // auto-emits it). Each of our custom event names is unreserved and
      // surfaces as its own row in the GA4 events report.
      await _analytics!.logEvent(name: eventName, parameters: params);
    } catch (innerError, innerStack) {
      AppLogger.instance.e(
        'AppTelemetry $eventName failed',
        error: innerError,
        stackTrace: innerStack,
      );
    }
  }

  static const String _fatalEventName = 'client_app_error';
  static const String _firebaseErrorEventName = 'firebase_error';
  static const String _hydratedBlocErrorEventName = 'hydrated_bloc_error';
  static const String _emptyContentEventName = 'firebase_empty_content';

  /// Returns true for error classes that pollute telemetry without being
  /// actionable — primarily transient browser-side network failures from
  /// third-party tile/image providers (OSM, ImageKit) which are already
  /// surfaced in DevTools and visible to the user as a missing tile.
  bool _isIgnorableError(Object error) {
    final type = error.runtimeType.toString();
    if (type == 'ClientException' || type == 'NetworkImageLoadException') {
      return true;
    }
    final message = error.toString();
    if (message.contains('Failed to fetch') || message.contains('tile.openstreetmap.org')) {
      return true;
    }
    return false;
  }

  Future<void> setUserProperty(String name, String? value) async {
    if (!_enabled || _analytics == null) {
      return;
    }
    try {
      await _analytics!.setUserProperty(name: name, value: value);
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'AppTelemetry setUserProperty failed ($name)',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Map<String, Object>? _sanitizeParams(Map<String, Object?>? params) {
    if (params == null || params.isEmpty) {
      return null;
    }
    final sanitized = <String, Object>{};
    params.forEach((key, value) {
      if (value == null) {
        return;
      }
      if (value is num || value is bool) {
        sanitized[key] = value;
      } else {
        sanitized[key] = _truncate(value.toString(), 100);
      }
    });
    return sanitized;
  }

  String _truncate(String value, int maxLength) {
    if (value.length <= maxLength) {
      return value;
    }
    return value.substring(0, maxLength);
  }

  String _topStackFrames(StackTrace? stack, int frameCount) {
    if (stack == null) {
      return '';
    }
    final lines = stack.toString().split('\n');
    final top = lines.take(frameCount).where((line) => line.trim().isNotEmpty).join(' | ');
    return top;
  }
}
