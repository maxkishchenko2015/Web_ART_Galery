# Run, Build, and Wasm Workflow

## Run locally

```bash
flutter run -d chrome
flutter run -d web-server
```

## Run with Wasm mode

```bash
flutter run -d chrome --wasm
```

## Disable web hot reload temporarily

```bash
flutter run -d chrome --no-web-experimental-hot-reload
```

## Build release output

```bash
flutter build web
```

## Build release with Wasm

```bash
flutter build web --wasm
```

Artifacts are generated in `build/web` and must be served together.
