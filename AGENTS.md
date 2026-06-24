# Art Gallery AI Context

This repository is a Flutter Web application for an Art Gallery.
When assisting with this project, read and apply context from all agent skills in the `.agents/skills/` directory.

## Vendor-agnostic config

Agent configuration is vendor-agnostic. The single source of truth is `.agents/`
(see [.agents/README.md](.agents/README.md)).

* Your vendor-specific folder (`.claude/`, `.cursor/`, …) and `CLAUDE.md` are
  **generated and READ-ONLY**. Do not edit them — changes are overwritten.
* To change agent config, edit `.agents/` (or this `AGENTS.md`) and run
  `bash .agents/setup`.

## Core Stack
* Framework: Flutter (Web target)
* Routing: go_router

## Available Skills
* [Agents MD Generator](.agents/skills/agents-md-generator/SKILL.md)
* [Dart Drift](.agents/skills/dart-drift/SKILL.md)
* [Flutter Adaptive UI](.agents/skills/flutter-adaptive-ui/SKILL.md)
* [Flutter Animations](.agents/skills/flutter-animations/SKILL.md)
* [Flutter Architecture](.agents/skills/flutter-architecture/SKILL.md)
* [Flutter Drift](.agents/skills/flutter-drift/SKILL.md)
* [Flutter DUIT BDUI](.agents/skills/flutter-duit-bdui/SKILL.md)
* [Flutter Internationalization](.agents/skills/flutter-internationalization/SKILL.md)
* [Flutter Navigation](.agents/skills/flutter-navigation/SKILL.md)
* [Flutter Networking](.agents/skills/flutter-networking/SKILL.md)
* [Flutter Result Cache](.agents/skills/flutter-result-cache/SKILL.md)
* [Flutter Slang Localization](.agents/skills/flutter-slang-localization/SKILL.md)
* [Flutter Testing](.agents/skills/flutter-testing/SKILL.md)
* [Flutter Theme Context L10n](.agents/skills/flutter-theme-context-l10n/SKILL.md)
* [Flutter Tooltips Patterns](.agents/skills/flutter-tooltips-patterns/SKILL.md)
* [Flutter UI Constants](.agents/skills/flutter-ui-constants/SKILL.md)
* [Flutter Utils](.agents/skills/flutter-utils/SKILL.md)
* [Flutter Web Environment](.agents/skills/flutter-web-environment/SKILL.md)
* [Flutter Web SEO](.agents/skills/flutter-web-seo/SKILL.md)
* [Project Guidelines](.agents/skills/project-guidelines/SKILL.md)
* [Version Bumper](.agents/skills/version-bumper/SKILL.md)
