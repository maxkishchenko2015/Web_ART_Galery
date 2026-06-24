---
name: flutter-theme-context-l10n
description: Patterns for Flutter app theming (light/dark), BuildContext access extensions, and MaterialApp localization delegates setup.
metadata:
  author: Maxkishchenko
  version: "1.0"
---

# Flutter Theme, Context, and Localization

## Overview

This skill captures app-shell patterns for:

- dark/light ThemeData setup and ThemeMode switching
- `BuildContext` extension helpers for theme/colors/layout access
- localization delegates and supported locales wiring in `MaterialApp`

## When to use

- Setting up a production app entry point (`MaterialApp`) with localization.
- Standardizing context access (`context.colors`, `context.textTheme`, etc.).
- Building stable spacing/safe-area helpers for pages and bottom sheets.
- Enabling light/dark themes with one source of truth.

## Key capabilities

- ThemeMode integration with `ValueListenableBuilder` or state management.
- Context extension patterns for design system + media query access.
- `localizationsDelegates` and `supportedLocales` configuration.
- App bootstrap examples combining theme, locale, routing, and wrappers.

## References

- `context-theme-extensions.md` - `BuildContext` extension patterns.
- `materialapp-localization-setup.md` - Delegates and locale wiring.
- `light-dark-theme-pattern.md` - Light/dark theme architecture.
- `app-bootstrap-pattern.md` - Putting theme + locale + builder together.

## Notes

- Keep theme/color access centralized through context extensions.
- Always include `GlobalMaterial`, `GlobalWidgets`, and `GlobalCupertino` delegates.
- Prefer explicit dark/light `ThemeData` and controlled `ThemeMode` switching.
