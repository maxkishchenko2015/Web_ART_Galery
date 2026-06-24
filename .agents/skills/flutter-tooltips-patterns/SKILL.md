---
name: flutter-tooltips-patterns
description: Patterns for feature onboarding tooltips in Flutter using OverlayEntry, step-based state (Bloc/Cubit), widget snapshots, and target GlobalKeys.
metadata:
  author: Maxkishchenko
  version: "1.0"
---

# Flutter Tooltips Patterns

## Overview

This skill documents robust patterns for multi-step feature tooltips (product tours) in Flutter.

It focuses on:

- Overlay-based presentation (`OverlayEntry`).
- Step-based flow control (Cubit/Bloc).
- Snapshot highlighting of target widgets.
- Safe lifecycle handling (route checks, timers, subscriptions, dispose).

## When to use

- Introducing new features to users with guided steps.
- Highlighting several actionable controls one-by-one.
- Building reusable tooltip tours across multiple screens.
- Avoiding fragile tooltip timing and route race conditions.

## Key capabilities

- Mixin-based tooltip orchestration for screens.
- Snapshot capture and overlay rendering per step.
- Target-key strategy for precise positioning.
- Dismiss/finish logic and one-time show persistence.

## References

- `overlay-tooltip-flow.md` - End-to-end overlay tour pattern.
- `snapshot-overlay-pattern.md` - Snapshot capture and safe disposal.
- `wallet-tooltip-widget-pattern.md` - Tooltip bubble positioning and arrow alignment.

## Notes

- Use `GlobalKey` only for elements that must be targeted.
- Cancel timers/subscriptions on hidden widget or route changes.
- Close/dispose every controller and overlay object in `dispose`.
