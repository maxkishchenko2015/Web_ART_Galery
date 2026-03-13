# Setup and Project Bootstrap

## Requirements

- Flutter SDK installed and up to date.
- Chrome or Edge installed.
- `flutter devices` shows at least one web target.

```bash
flutter devices
```

## New project with web

```bash
flutter create my_app
```

## Add web to existing project

```bash
flutter create . --platforms web
```

This regenerates/creates `web/` assets used to bootstrap Flutter Web.

## Common quick checks

- Run `flutter doctor -v`.
- Ensure browser target appears as `Chrome (web)` or `Edge (web)`.
- Verify repository keeps `web/index.html` compatible with current Flutter channel.
