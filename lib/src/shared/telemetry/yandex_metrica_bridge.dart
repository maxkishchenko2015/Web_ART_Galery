import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:flutter/foundation.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Thin bridge to the Yandex Metrica JS API.
///
/// All public methods mirror [AppTelemetry]'s API so the two can be driven
/// in lock-step. Calls are forwarded to [window.ymSend] — a small helper
/// defined in `web/index.html` that wraps the native `ym()` function.
///
/// The bridge becomes a no-op when:
///   • the app is not running on the Web (non-web targets)
///   • [window.ymSend] is not present in the JS context (local dev without
///     the Yandex snippet, or an ad-blocker that removed it)
class YandexMetricaBridge {
  YandexMetricaBridge._();

  static final YandexMetricaBridge instance = YandexMetricaBridge._();

  bool _enabled = false;

  Future<void> initialize() async {
    if (_enabled) return;
    if (!kIsWeb) return;
    try {
      final available = globalContext.has('ymSend');
      if (available) {
        _enabled = true;
      } else {
        AppLogger.instance.w('YandexMetricaBridge: ymSend not found — Metrica events disabled');
      }
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'YandexMetricaBridge initialize failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Records a virtual page view (SPA navigation).
  void logHit(String url, String screenName) {
    if (!_enabled) return;
    try {
      _ymSend('hit'.toJS, url.toJS, null);
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'YandexMetricaBridge logHit failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Fires a Metrica goal (maps 1-to-1 to [AppTelemetry.logEvent]).
  void reachGoal(String goalName, {Map<String, Object?>? params}) {
    if (!_enabled) return;
    try {
      final paramsJson = _encodeParams(params);
      _ymSend('reachGoal'.toJS, goalName.toJS, paramsJson?.toJS);
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'YandexMetricaBridge reachGoal failed ($goalName)',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Sends a user parameter pair (maps to [AppTelemetry.setUserProperty]).
  void setUserParams(String name, String? value) {
    if (!_enabled) return;
    try {
      final paramsJson = jsonEncode({name: value});
      _ymSend('userParams'.toJS, ''.toJS, paramsJson.toJS);
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'YandexMetricaBridge setUserParams failed ($name)',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  String? _encodeParams(Map<String, Object?>? params) {
    if (params == null || params.isEmpty) return null;
    final sanitized = <String, Object>{};
    params.forEach((key, value) {
      if (value != null) sanitized[key] = value;
    });
    return sanitized.isEmpty ? null : jsonEncode(sanitized);
  }
}

// ---------------------------------------------------------------------------
// JS interop — calls window.ymSend(method, target, paramsJson?)
// ---------------------------------------------------------------------------

@JS('window.ymSend')
external void _ymSend(JSString method, JSString target, JSString? paramsJson);
