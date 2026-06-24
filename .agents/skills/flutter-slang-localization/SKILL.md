---
name: flutter-slang-localization
description: Type-safe Flutter localization with Slang and slang_flutter. Covers setup, code generation, MaterialApp integration, locale switching, and CLI workflows.
metadata:
  author: Maxkishchenko
  version: "1.0"
---

# Flutter Slang Localization

## Overview

This skill documents how to implement localization using Slang in Flutter apps.

Pinned baseline versions:

- `slang: ^4.13.0`
- `slang_flutter: ^4.13.0`

## When to use

- You want type-safe i18n with compile-time checks.
- You need JSON/YAML/CSV/ARB support in one solution.
- You want clean locale switching and Flutter rebuild behavior.
- You need tooling for analysis, normalization, and migration.

## Key capabilities

- Minimal setup from translation files to generated Dart API.
- `TranslationProvider` + `MaterialApp` integration.
- Locale management with `LocaleSettings`.
- Practical CLI flow (`generate`, `analyze`, `normalize`, `configure`).

## References

- `setup-and-dependencies.md` - Install and configure Slang.
- `flutter-integration.md` - Provider + delegates + MaterialApp wiring.
- `generation-and-cli.md` - Core commands and daily workflow.
- `locale-management.md` - Device locale, manual locale, and streams.
- `slang-yaml-template.md` - Example `slang.yaml` template.

## Notes

- Keep one translation entrypoint file imported across app features.
- Regenerate translations after translation file changes.
- Include Flutter localization delegates for system widgets.
