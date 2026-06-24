---
name: flutter-web-environment
description: Comprehensive Flutter Web environment skill covering setup, dev server configuration, renderers, Wasm, bootstrap customization, embedding modes, interop constraints, testing, and deployment.
metadata:
  author: Maxkishchenko
  version: "1.0"
---

# Flutter Web Environment

## Overview

This skill covers practical Flutter Web work end-to-end:

- environment setup and device validation
- run/debug/build workflows
- Wasm mode and browser compatibility
- web dev server central config (`web_dev_config.yaml`)
- renderer and startup customization
- embedding Flutter into existing web apps
- JS interop compatibility for Wasm
- testing, profiling, and deployment checks

## When to use

- Creating a new Flutter Web app or enabling web in an existing project.
- Standardizing web run/build flags for local and CI workflows.
- Configuring proxies/headers/HTTPS for development server.
- Customizing `flutter_bootstrap.js` startup flow.
- Embedding Flutter view(s) into host web applications.

## Key capabilities

- Full command reference for `flutter run` and `flutter build web` variants.
- Wasm rollout guidance with fallback behavior awareness.
- Multi-view embedded mode patterns (`runWidget`, `addView`, `removeView`).
- Browser page-title patterns plus app-switcher title integration.
- HydratedBloc web persistence patterns for restoring state after refresh.
- Web-specific performance/debug/testing recommendations.

## References

- `setup-and-project-bootstrap.md` - Setup, devices, and enabling web.
- `run-build-wasm-workflow.md` - Run/build commands including Wasm.
- `web-dev-config-yaml.md` - Centralized dev server config and proxy rules.
- `renderers-and-performance.md` - Renderers, profiling, and tuning.
- `bootstrap-and-loader-customization.md` - Custom `flutter_bootstrap.js` patterns.
- `embedding-modes-and-multiview.md` - Full page, iframe, hostElement, multi-view.
- `interop-and-web-compatibility.md` - JS interop migration and Wasm constraints.
- `page-title-and-app-switcher.md` - Page title and app switcher integration.
- `hydrated-bloc-web-refresh-persistence.md` - Persist/restore bloc state on refresh.
- `testing-debugging-and-release-checklist.md` - Practical QA/release checklist.

## Notes

- Keep web app shell files (`web/index.html`, `web/flutter_bootstrap.js`) aligned with Flutter version.
- Validate browser/device support in CI and local docs.
- Profile performance in profile/release web builds, not debug mode.
