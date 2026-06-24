# Bootstrap and Loader Customization

Customize startup by providing your own `web/flutter_bootstrap.js`.

## Required components in custom bootstrap

1. `{{flutter_js}}`
2. `{{flutter_build_config}}`
3. `_flutter.loader.load(...)`

## Minimal example

```javascript
{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load();
```

## Configurable loader fields

- `renderer`
- `hostElement`
- `assetBase`
- `entrypointBaseUrl`
- `forceSingleThreadedSkwasm`

## Useful hook

`onEntrypointLoaded` can display startup progress and control engine initialization sequence.
