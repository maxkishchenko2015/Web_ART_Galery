# Embedding Modes and Multi-view

## Modes

- Full page mode (default)
- iframe embedding
- Embedded mode (multi-view) in host elements

## hostElement single-view embed

```javascript
_flutter.loader.load({
  config: {
    hostElement: document.getElementById('flutter_host'),
  },
});
```

## Enable multi-view

```javascript
_flutter.loader.load({
  onEntrypointLoaded: async (engineInitializer) => {
    const engine = await engineInitializer.initializeEngine({
      multiViewEnabled: true,
    });
    const app = await engine.runApp();
    // app.addView(...) / app.removeView(...)
  },
});
```

## Dart entrypoint in multi-view

Use `runWidget(...)` instead of `runApp(...)` when no implicit view is guaranteed.
