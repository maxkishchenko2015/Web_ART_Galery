# URL Launcher Utils

Wrap `url_launcher` with a small utility API instead of calling it directly in widgets.

## Recommended surface

- `launchWebView(...)`
- `launchUrlIfPossible(...)`
- `launchMailIfPossible(...)`
- `launchTelIfPossible(...)`
- `openMap(latitude, longitude)`

## Pattern highlights

- Parse and validate URI before launch.
- Check `canLaunchUrl` before attempting launch.
- Centralize fallback behavior and error logging.
- Allow optional `LaunchMode` override.
- Keep per-platform logic inside utility methods.

## Minimal pattern

```dart
abstract final class UrlLauncherUtils {
  static Future<bool> launchUrlIfPossible({
    required String url,
    LaunchMode? mode,
  }) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;

    if (!await canLaunchUrl(uri)) return false;
    try {
      return await launchUrl(uri, mode: mode ?? LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }
}
```

## Platform map fallback

- Android: try native `google.navigation:` intent, fallback to web maps URL.
- iOS: try Apple Maps URL.
- On failure: log once and exit gracefully.
