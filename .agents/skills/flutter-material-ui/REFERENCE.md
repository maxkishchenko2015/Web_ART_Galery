# flutter-material-ui — reference

Loaded on demand from `SKILL.md`.

> Origin note: sections 2–4 describe the **dtc-flutter** monorepo this convention came from
> (multi-package, `fvm`, `very_good`, `LegacyMaterialBridge`, four apps, `scripts/`). This repo
> (`web_art_galery`) is a single package: it uses material_ui's `MaterialUiCompatibilityBridge`
> directly in `lib/main.dart` (no custom `LegacyMaterialBridge`), has no `scripts/` CI guard, and
> no `very_good`. Keep the paths below as the pattern to mirror, not literal paths here.

## 1. Symptom → cause → fix

| Symptom | Cause | Fix |
|---|---|---|
| `A value of type 'ThemeData/*1*/' can't be assigned to ... 'ThemeData/*2*/'` | The file still imports the SDK's legacy Material library, the theme comes from `material_ui` | Import `package:material_ui/material_ui.dart` instead |
| `No Material widget found` (TextField, InkWell, ListTile) | Widget and its `Material` ancestor come from different libraries | Migrate the widget; for a legacy third-party widget use `MaterialUiCompatibilityBridge` or a local `legacy_material.Material(type: MaterialType.transparency)` |
| `No MaterialLocalizations found` | Only one library's localizations are registered | Add `...GlobalMaterialLocalizations.delegates` (material_ui); add the legacy delegate for legacy widgets |
| `No ScaffoldMessenger widget found. Navigator widgets require a ScaffoldMessenger` | Legacy `MaterialApp` in a test while navigation uses the material_ui one | Build the test host with the material_ui `MaterialApp` |
| Widget test hangs ~10 min, then `TimeoutException` | Mixed tree: a dialog never opens, `await dialogResult` never completes | Migrate the test's imports to material_ui |
| `ambiguous_import: GlobalMaterialLocalizations` | `flutter_localizations` imported unaliased next to material_ui | Use material_ui's `...GlobalMaterialLocalizations.delegates`, or alias `as legacy_localizations` |
| `A CupertinoLocalizations delegate that supports the <locale> locale was not found` | Legacy `GlobalCupertinoLocalizations` used with material_ui widgets | Use material_ui's `...GlobalMaterialLocalizations.delegates` (plural) |
| Golden `Pixel test failed, 69%` + `No Material widget found` in the log | Alchemist's legacy host around a material_ui widget | Add a material_ui host (`_host()`), don't regenerate the golden |
| Golden test file reports "No tests were found" | `CI` env var not set | `CI=true flutter test --dart-define=CI=true` |

## 2. Bridge internals (material_ui `MaterialUiCompatibilityBridge`)

`MaterialUiCompatibilityBridge` is `@Deprecated` — a temporary migration utility material_ui
will remove. It adds `legacy.Theme` (mapped from the material_ui theme) and
`legacy.Localizations.override` with the legacy delegates. The dtc-flutter `LegacyMaterialBridge`
wrapped it with an extra legacy transparent `Material`.

- **Invisible to material_ui widgets.** They look up material_ui's own inherited types, so
  wrapping the whole app does not change how migrated widgets behave.
- **Lossy theme.** Only `colorScheme`, `textTheme`, `platform`, `visualDensity` are mapped.
  Component themes (`inputDecorationTheme`, button themes, `appBarTheme`, ...) are not, so
  legacy widgets look close to, not exactly like, the design system.
- **No Material ancestor.** The compat bridge adds legacy Theme + localizations but not a legacy
  `Material`. Legacy `InkWell`/`TextField` paint on the nearest legacy `Material`; if none is in
  scope, add a local `legacy_material.Material(type: MaterialType.transparency)` next to the widget.
- **Masks debt.** A stray legacy widget works in the app (root bridge) but fails in tests
  without it.
- **Overlays.** Popups of legacy widgets render above the app root, so a subtree-only
  `Localizations.override` does not reach them — keep legacy delegates at app level until those
  dependencies are gone.

Preferred end state: subtree usage (wrap only the legacy widget), then removal.

## 3. Tests (origin monorepo conventions)

Host with `MaterialApp` / `Scaffold` **from `material_ui`**. Localizations:

```dart
localizationsDelegates: const [
  S.delegate,
  ...GlobalMaterialLocalizations.delegates, // material_ui: covers Widgets + Cupertino
],
```

- Don't import `flutter_localizations` unaliased next to `material_ui`
  (`ambiguous_import: GlobalMaterialLocalizations`).
- A widget under test that embeds a legacy third-party widget: also add the legacy delegate
  (`import 'package:flutter_localizations/flutter_localizations.dart' as legacy_localizations;`)
  or wrap the subject in the compat bridge.
- **A widget test that hangs ~10 min is a mixed-library bug until proven otherwise** (a dialog
  never opens, so `await dialogResult` never completes).

### Golden tests (alchemist)

Alchemist wraps scenarios in the SDK's legacy `MaterialApp`. Wrap each scenario in a host with
the `material_ui` `Material` + localizations. Don't regenerate golden images to hide a missing
host.

### Run like CI

CI mode is the `CI` **environment variable**, not only the define:

```bash
CI=true flutter test --dart-define=CI=true
```

`scripts/run_package_ci.sh` runs a package's tests CI-equivalent with a hang watchdog (origin
monorepo: fvm + very_good; adapt before use here).

## 4. After a bulk merge that brings in new files

Legacy imports in files added by a merge produce no git conflict, so re-check:

```bash
grep -rl "package:flutter/material.dart\|package:flutter/cupertino.dart" lib/ test/ \
  | grep -v "\.g\.dart\|\.freezed\.dart"      # expect no output
dart analyze
dart format --line-length=100 <touched files>
```
