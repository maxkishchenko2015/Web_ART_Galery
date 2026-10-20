---
name: flutter-material-ui
description: Rules for Flutter 3.47's standalone design packages — every widget file imports package:material_ui/material_ui.dart (and package:cupertino_ui/cupertino_ui.dart), never the SDK's legacy package:flutter/material.dart or package:flutter/cupertino.dart — plus the MaterialUiCompatibilityBridge interop boundary for go_router's legacy pages, the google_fonts ^9 pairing, and the legacy-import check. Use when writing or migrating widgets, screens, or tests; when a file needs Material or Cupertino widgets or still imports the SDK's legacy library; or when you see "ThemeData/*1*/ can't be assigned to ThemeData/*2*/", "No Material widget found", "No MaterialLocalizations found", "No ScaffoldMessenger widget found", ambiguous_import on GlobalMaterialLocalizations, or a widget test that hangs until timeout.
---

# flutter-material-ui

Since Flutter 3.47 this app runs on the standalone `material_ui` / `cupertino_ui`
packages. They define classes with the **same names** as the SDK's legacy libraries
(`ThemeData`, `Material`, `ScaffoldMessenger`, `MaterialLocalizations`, `Theme`,
`TextTheme`), but the two sets are **not interchangeable**: a widget from one library
never sees ancestors from the other. Almost every failure below is a mixed-library tree.

`REFERENCE.md` holds the dtc-flutter monorepo origin notes (LegacyMaterialBridge, golden
hosts, the `check_no_legacy_material_imports.sh` CI guard, bulk `git merge dev` steps) and
a full symptom→cause→fix table. `scripts/run_package_ci.sh` is that monorepo's CI-equivalent
test runner with a hang watchdog (origin-specific: fvm + very_good; not wired here).

## 1. Imports

Every file that uses Material or Cupertino widgets imports:

```dart
import 'package:material_ui/material_ui.dart';
import 'package:cupertino_ui/cupertino_ui.dart'; // only when Cupertino widgets are used
```

- `material_ui.dart` re-exports `package:flutter/widgets.dart`, so `Widget`, `BuildContext`,
  `State`, `EdgeInsets`, `Colors`, `Icons`, etc. come through it. No separate widgets import
  is needed alongside it.
- Unchanged, import directly as before: `package:flutter/widgets.dart`, `services.dart`,
  `gestures.dart`, `rendering.dart`, `semantics.dart`, `foundation.dart`.
- Never import `package:flutter/material.dart` or `package:flutter/cupertino.dart` in `lib/`
  or `test/`. Check before committing:
  ```bash
  grep -rl "package:flutter/material.dart\|package:flutter/cupertino.dart" lib/ test/ \
    | grep -v "\.g\.dart\|\.freezed\.dart"
  ```
  (expect no output). `.g.dart` / `.freezed.dart` inherit imports from their source — fix the
  source and re-run `dart run build_runner build`.
- `pubspec.yaml` lists `material_ui: ^1.7.0` and `cupertino_ui: ^1.1.3` as direct deps.

## 2. google_fonts

`google_fonts: ^9.0.0` imports `package:material_ui`. It pairs **only** with a material_ui
app — on the SDK's legacy Material it raises `TextTheme can't be assigned to TextTheme?`.
Keep it at `^9`; do not downgrade to 8.x (that version is for legacy-Material apps).
`AppTheme` ([lib/src/shared/config/app_theme.dart](../../../lib/src/shared/config/app_theme.dart))
builds its `TextTheme` from `GoogleFonts.*` and a material_ui `ThemeData` — both must be
material_ui types.

## 3. Localizations + go_router interop

- Use material_ui's localizations: `localizationsDelegates: GlobalMaterialLocalizations.delegates`
  (plural `.delegates` covers Widgets + Material + Cupertino). It comes from `material_ui`, so
  **do not** also import `package:flutter_localizations/flutter_localizations.dart` unaliased —
  that triggers `ambiguous_import: GlobalMaterialLocalizations`. Alias it `as legacy_localizations`
  only if a legacy widget genuinely needs the legacy delegate.
- go_router emits the SDK's legacy `MaterialPage` for routes built without a custom
  `pageBuilder`. Those legacy pages look up a legacy `Theme` / `MaterialLocalizations`. The app
  bridges this once in `MaterialApp.router`'s `builder`
  ([lib/main.dart](../../../lib/main.dart)):
  ```dart
  // ignore: deprecated_member_use
  builder: (context, child) => MaterialUiCompatibilityBridge(child: child!),
  ```
  `MaterialUiCompatibilityBridge` (material_ui, `@Deprecated` migration utility) maps the
  material_ui `ThemeData` → a legacy `Theme` and installs legacy localizations delegates, so
  legacy route scaffolding resolves. It maps only `colorScheme`, `textTheme`, `platform`,
  `visualDensity` — no component themes — and adds **no** legacy `Material` ancestor. If a
  legacy third-party widget throws `No Material widget found`, wrap just that widget in a local
  legacy `Material(type: MaterialType.transparency)` (aliased import), or migrate it.

## 4. Diagnose by error

| Symptom | Cause | Fix |
|---|---|---|
| `TextTheme/ThemeData/*1*/ can't be assigned to .../*2*/` | File still imports SDK legacy Material; the other type is material_ui | Switch the import to `package:material_ui/material_ui.dart` |
| `No Material widget found` | Widget and its `Material` ancestor are from different libraries | Migrate the widget, or wrap a legacy one in a local legacy transparent `Material` |
| `No MaterialLocalizations found` | Only one library's localizations registered | Use `...GlobalMaterialLocalizations.delegates` (material_ui); bridge legacy subtrees |
| `ambiguous_import: GlobalMaterialLocalizations` | `flutter_localizations` imported unaliased next to material_ui | Drop it, or alias `as legacy_localizations` |
| Widget test hangs ~10 min then `TimeoutException` | Mixed tree: a dialog never opens, `await` never completes | Migrate the test host imports to material_ui |

See `REFERENCE.md` for the full table and the origin monorepo's bridge/test/CI details.
