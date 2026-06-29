import 'page_reload_stub.dart' if (dart.library.html) 'page_reload_web.dart';

/// Hard-reloads the page exactly once for the given [key], guarded so a
/// persistent failure cannot loop. Returns `true` when a reload was triggered
/// (caller should keep showing a loader), `false` when a reload already
/// happened for this [key] or the platform is not the web (caller should show
/// its own error UI).
///
/// Used to recover from "Deferred library archive was not loaded" — the chunk
/// 404 a stale browser tab hits after a redeploy. A single reload pulls the
/// fresh `main.dart.js` + deferred manifest and resolves it.
bool tryReloadOnceForStaleChunk(String key) => tryReloadOnceForStaleChunkImpl(key);

/// Unconditional hard reload of the page. No-op off the web. Used by the
/// global error fallback's "reload" action.
void reloadPage() => reloadPageImpl();
