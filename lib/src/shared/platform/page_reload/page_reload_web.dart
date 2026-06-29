import 'package:web/web.dart' as web;

/// Reloads the page once per [key] using `sessionStorage` as the guard. The
/// flag lives for the tab's session, so a fresh tab gets one more attempt while
/// a reload loop within the same tab is prevented.
bool tryReloadOnceForStaleChunkImpl(String key) {
  final storage = web.window.sessionStorage;
  if (storage.getItem(key) != null) {
    return false;
  }
  storage.setItem(key, '1');
  web.window.location.reload();
  return true;
}

void reloadPageImpl() => web.window.location.reload();
