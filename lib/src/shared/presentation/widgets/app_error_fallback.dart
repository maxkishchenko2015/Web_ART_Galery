import 'package:flutter/material.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/platform/page_reload/page_reload.dart';

/// Replacement for Flutter's default grey/red [ErrorWidget] in release builds.
///
/// Installed via `ErrorWidget.builder` in `main.dart`. It must be entirely
/// self-contained: an [ErrorWidget] can be built before/around the
/// [MaterialApp], so this widget supplies its own [Directionality] and a
/// [Material] surface rather than relying on inherited `Theme`/`MediaQuery`.
/// Strings come from slang's top-level `t` (locale-aware, no `BuildContext`
/// needed), with a hard-coded fallback if even that is unavailable.
class AppErrorFallback extends StatelessWidget {
  const AppErrorFallback({required this.details, super.key});

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    String title;
    String retry;
    try {
      title = t.common.errorTitle;
      retry = t.common.retry;
    } catch (_) {
      title = 'Something went wrong';
      retry = 'Retry';
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        color: const Color(0xFFFFFFFF),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Color(0xFF9E9E9E)),
                const SizedBox(height: 16),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Color(0xFF333333)),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: reloadPage,
                  icon: const Icon(Icons.refresh),
                  label: Text(retry),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
