# Testing, Debugging, and Release Checklist

## Debugging tools split

- Flutter DevTools: logs, inspector, app-level debugging.
- Chrome DevTools: timeline/perf/network/browser-level diagnostics.

## Testing layers

- Widget tests for UI logic.
- Integration tests for browser flows and routing.

## Release checklist

1. `flutter build web` (and optionally `--wasm`).
2. Validate target browser matrix.
3. Check service worker/bootstrap warnings in console.
4. Confirm static hosting serves all `build/web` artifacts.
5. Confirm headers for Wasm threading if used.
6. Smoke test deep links and refresh routing behavior.
