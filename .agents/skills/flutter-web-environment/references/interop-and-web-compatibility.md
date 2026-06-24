# Interop and Web Compatibility

## Wasm compatibility essentials

- Wasm builds can still include JS fallback at runtime.
- Browser engine capabilities determine whether Wasm path is actually used.

## Interop migration guidance

For Wasm-friendly code paths:

- Prefer `package:web` over `dart:html`.
- Prefer `dart:js_interop` over `package:js` and `dart:js`.

## iOS browser caveat

All iOS browsers use WebKit; validate Wasm-specific expectations carefully.

## Dependency hygiene

- Audit packages for web+wasm compatibility.
- Keep a compatibility checklist in CI for critical dependencies.
