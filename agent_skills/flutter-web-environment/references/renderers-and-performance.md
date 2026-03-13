# Renderers and Performance

## Renderer strategy

Flutter Web can run with different renderer modes depending on runtime/browser and config.

- Use defaults unless profiling indicates a bottleneck.
- Validate behavior on target browser matrix.

## Wasm threading notes

Multi-threaded skwasm requires server headers:

- `Cross-Origin-Embedder-Policy: credentialless` (or `require-corp`)
- `Cross-Origin-Opener-Policy: same-origin`

Without these headers, runtime may fall back to single-threaded behavior.

## Profiling recommendations

- Collect performance data in profile/release builds.
- Use Chrome DevTools for timeline and rendering diagnostics.
- Use Flutter DevTools for logs, widget inspector, and runtime debugging.
