---
name: flutter-utils
description: Practical utility patterns for Flutter projects including URL launching, validators, input formatting, amount formatting, route/context extensions, and country-code helpers.
metadata:
  author: Maxkishchenko
  version: "1.0"
---

# Flutter Utils

## Overview

This skill captures reusable utility patterns commonly used across Flutter codebases.

It focuses on production-friendly utils for:

- external actions (`url_launcher`, mail, tel, maps)
- form and field validation
- text-input formatting
- amount/currency formatting helpers
- context/route argument access
- country-code lookup/cache helpers

## When to use

- You need stable helper methods shared by multiple features.
- A project has duplicate validator/formatter logic spread across screens.
- You want centralized wrappers around external-launch behavior and logging.
- You need deterministic formatting behavior for money and phone inputs.

## Key capabilities

- Utility class structure and API design patterns.
- Validation strategy with localized error messages.
- Input formatting patterns for phone/country code fields.
- Safe launcher and map-opening fallbacks by platform.
- Country code indexing, filtering, and local cache refresh patterns.

## References

- `url-launcher-utils.md` - Launcher wrappers for web/mail/tel/map.
- `common-validators.md` - Validation architecture and regex strategy.
- `phone-number-format-utils.md` - Input formatter and cleanup extensions.
- `amount-formatter-utils.md` - Amount and currency rendering patterns.
- `context-extensions.md` - Typed route args extension.
- `country-codes-helper.md` - Country-code lookup and cache patterns.

## Notes

- Keep utility APIs side-effect aware and log failures explicitly.
- Prefer feature-safe wrappers over calling external packages directly in UI.
- Isolate locale-sensitive formatting decisions in one place.
