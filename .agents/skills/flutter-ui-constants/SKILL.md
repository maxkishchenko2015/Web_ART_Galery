---
name: flutter-ui-constants
description: Define and use centralized Flutter UI constants for margins, radii, font sizes, icon sizes, button sizes, breakpoints, and layout metrics. Use when creating or migrating design tokens and spacing systems in Flutter apps.
metadata:
  author: Maxkishchenko
  version: "1.0"
---

# Flutter UI Constants

## Overview

Create a single source of truth for layout and typography constants in Flutter projects. This skill helps standardize spacing, font sizes, border radii, elevations, icon sizes, and common widget dimensions.

## When to use

- Starting a new design token system for Flutter UI.
- Replacing magic numbers in widgets.
- Unifying spacing and typography across modules.
- Migrating legacy UI to centralized constants.
- Defining responsive layout thresholds and shared dimensions.

## What this skill provides

- A full `KSize` constants class template.
- Naming and grouping conventions for constants.
- Usage examples for paddings, text styles, and layout widgets.
- Recommendations to keep constants maintainable.

## Key references

- `references/ksize-full-class.md` - Full `KSize` class template.
- `references/constants-guidelines.md` - Best practices and usage patterns.

## Notes

- Keep constants immutable (`static const`).
- Prefer semantic names over raw numbers in widgets.
- Group constants by concern: spacing, radius, typography, icons, component sizes.
