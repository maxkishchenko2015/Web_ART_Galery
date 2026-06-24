# AGENTS-SKILS

[Russian version](README.ru.md)

A collection of agent skills for AI assistants working with Dart and Flutter projects, implemented in the [**Agent Skills**](https://agentskills.io/home) format — an open standard for extending AI agents.

Each skill provides **structured knowledge** based on official documentation, ready-to-use code examples, and detailed reference materials that AI agents can leverage.

## Contents 📋

- [Overview](#overview)
- [Skills](#skills)
  - [AGENTS.md Generator](#agents-md-generator)
  - [Dart Drift](#dart-drift)
  - [Flutter Adaptive UI](#flutter-adaptive-ui)
  - [Flutter Animations](#flutter-animations)
  - [Flutter Architecture](#flutter-architecture)
  - [Flutter Drift](#flutter-drift)
  - [Flutter Internationalization](#flutter-internationalization)
  - [Flutter Navigation](#flutter-navigation)
  - [Flutter Networking](#flutter-networking)
  - [Flutter Web Environment](#flutter-web-environment)
  - [Flutter Result and Cache](#flutter-result-and-cache)
  - [Flutter Slang Localization](#flutter-slang-localization)
  - [Flutter Theme, Context, and Localization](#flutter-theme-context-and-localization)
  - [Flutter Tooltips Patterns](#flutter-tooltips-patterns)
  - [Flutter Utils](#flutter-utils)
  - [Flutter UI Constants](#flutter-ui-constants)
  - [Flutter Testing](#flutter-testing)
  - [Flutter Backend-driven UI with Duit](#flutter-backend-driven-ui-with-duit)
- [File structure](#file-structure)
- [How to use](#how-to-use)
- [Skills application matrix](#skills-application-matrix)
- [License](#license)
- [Contributing](#contributing)
- [Additional resources](#additional-resources)

## Overview 🎯

This repository contains a set of specialized skills for Dart and Flutter development, organized according to the open [**Agent Skills**](https://agentskills.io/home) standard.

### What are Agent Skills?

Agent Skills are an open format for providing AI agents with new capabilities and expertise. They are structured folders with instructions, scripts, and resources that agents can discover and use to complete tasks more accurately and efficiently.

**Created by:** Anthropic  
**Status:** Open standard  
**Supported by:** Leading AI development tools

### Skill composition

Each skill includes:

- **SKILL.md** — skill description with metadata and usage conditions
- **Reference documentation** — detailed guides in `references/`
- **Code examples** — ready-to-use templates and examples in `assets/`
- **Best practices** — recommendations and guidelines
- **Scripts** (optional) — helper utilities in `scripts/`

### What Agent Skills enable

✨ **Domain expertise** — specialized knowledge in specific areas  
🚀 **New capabilities** — new abilities for agents  
🔄 **Repeatable workflows** — standardized, repeatable workflows  
🔗 **Interoperability** — reuse across different AI tools

## Skills 🛠️

### AGENTS.md Generator

**Directory:** `agents-md-generator/`

**Description:** Create or update minimal AGENTS.md files in the repository root and nested module directories using progressive disclosure. Works across heterogeneous projects without assuming any fixed agent folder structure.

**When to use:**

- AGENTS.md is missing, bloated, contradictory, or outdated
- A new package/service/module appears
- Repository structure changes (monorepo growth or split)
- Teams want consistent agent context across diverse stacks

**Key capabilities:**

- Discover repository shape (git root, language/tool markers)
- Detect module boundaries (build manifests, deployable units)
- Generate root AGENTS.md (≤60 lines): purpose, toolchain, commands, docs links
- Generate nested AGENTS.md (≤40 lines): module purpose, local commands
- Progressive disclosure: keep AGENTS.md concise, link to docs/skills
- Adaptive skill referencing (local or external)

**Output:**

- `<repo_root>/AGENTS.md`
- `<module_dir>/AGENTS.md` (for independent packages/services)

**References:**

- `AGENTS_TEMPLATE_ROOT.md` — Root AGENTS.md template
- `AGENTS_TEMPLATE_MODULE.md` — Nested module template

---

### Dart Drift

**Directory:** `dart-drift/`

**Description:** A complete guide to using the drift library for working with databases in Dart applications (CLI, server applications, non-Flutter desktop apps).

**When to use:**

- Building Dart apps that need a local SQLite store
- Connecting to PostgreSQL with type-safe queries
- Reactive data streams
- Implementing database schema migrations
- Building server services with connection pooling

**Key capabilities:**

- Setup with `sqlite3` or `drift_postgres`
- Defining tables and constraints
- SELECT, WHERE, JOIN, aggregations
- INSERT, UPDATE, DELETE, transactions
- Reactive stream queries
- Database schema migrations

**References:**

- `setup.md` — SQLite & PostgreSQL setup
- `postgres.md` — PostgreSQL-specific features
- `tables.md` — Table definitions
- `queries.md` — Database queries
- `writes.md` — Write operations
- `streams.md` — Reactive streams
- `migrations.md` — Schema migrations

---

### Flutter Adaptive UI

**Directory:** `flutter-adaptive-ui/`

**Description:** Building adaptive and responsive Flutter UIs that work great across platforms and screen sizes.

**When to use:**

- Building apps for multiple platforms (mobile, tablet, desktop, web)
- Adapting layouts for different screen sizes
- Supporting different input devices (touch, mouse, keyboard)
- Implementing responsive navigation patterns
- Optimizing for large screens and foldables
- Using Capability and Policy patterns for platform-specific behavior

**Key concepts:**

- **3-step approach:** Abstract → Measure → Branch
- **Breakpoints:** Compact (<600), Medium (600-840), Expanded (≥840)
- **Layout rule:** Constraints go down. Sizes go up. Parent sets position.
- **Capability/Policy pattern** for platform-specific behavior

**References:**

- `layout-constraints.md` — Constraints system with 29 examples
- `layout-basics.md` — Core layout widgets
- `layout-common-widgets.md` — Container, GridView, ListView, Stack
- `adaptive-workflow.md` — The 3-step approach in detail
- `adaptive-best-practices.md` — Design best practices
- `adaptive-capabilities.md` — Capability/Policy pattern

**Examples:**

- `responsive_navigation.dart` — Switching NavigationBar ↔ NavigationRail
- `capability_policy_example.dart` — Capability/Policy class examples

---

### Flutter Animations

**Directory:** `flutter-animations/`

**Description:** A comprehensive guide to implementing animations in Flutter.

**When to use:**

- Adding motion and visual effects to your app
- Implementing implicit animations (simple transitions)
- Building explicit animations (full control)
- Implementing hero animations (shared element transitions)
- Creating staggered animations (sequential/overlapping)
- Using physics-based animations

**Animation types:**

**Implicit Animations** — for simple cases:

- AnimatedContainer, AnimatedOpacity
- TweenAnimationBuilder
- Animations are triggered by state changes

**Explicit Animations** — for full control:

- AnimationController, Tween, CurvedAnimation
- AnimatedWidget, AnimatedBuilder
- Monitoring animation state
- Multiple simultaneous animations

**Hero Animations** — shared element transitions:

- Standard hero transitions
- Radial hero animations
- Navigation between screens

**Staggered Animations** — sequential effects:

- Interval-based timing
- Ripple effects
- Menus with sequential appearance

**Physics-Based** — natural motion:

- Spring simulations
- Fling animations
- Gravity-based animations

**References:**

- `implicit.md` — Implicit animations
- `explicit.md` — Explicit animations with AnimationController
- `hero.md` — Hero transitions
- `staggered.md` — Staggered patterns
- `physics.md` — Physics-based animations
- `curves.md` — Curves reference

**Templates:**

- `implicit_animation.dart`
- `explicit_animation.dart`
- `hero_transition.dart`
- `staggered_animation.dart`

---

### Flutter Architecture

**Directory:** `flutter-architecture/`

**Description:** A comprehensive guide to Flutter app architecture using Bloc/Cubit pattern and feature-first organization.

**When to use:**

- Designing or refactoring a Flutter app architecture
- Choosing between feature-first and layer-first project structures
- Implementing Bloc/Cubit in Flutter
- Building a scalable structure for teams
- Adding new features to an existing architecture
- Applying best practices and design patterns

**Project organization:**

**Feature-First (recommended for teams):**

- Organized by business capabilities
- Medium and large apps (10+ features)
- Team development (2+ developers)
- Self-contained feature modules

**Layer-First (traditional):**

- Organized by architectural layers
- Small and medium apps
- Solo developers or small teams
- Simple business logic

**Architectural layers:**

- **UI Layer:** Pages/widgets and Bloc/Cubit (UI state logic)
- **Data Layer:** Repositories (SSOT) and Services (data sources)
- **Domain Layer:** Use cases for complex business logic (optional)

**Design patterns:**

- Command Pattern — action encapsulation
- Result Type — type-safe error handling
- Repository Pattern — abstraction over data sources
- Offline-First — optimistic UI updates

**References:**

- `concepts.md` — Core architecture principles
- `feature-first.md` — Feature-first organization
- `mvvm.md` — Bloc/Cubit implementation (legacy filename)
- `layers.md` — Layers and their interactions
- `design-patterns.md` — Common patterns

**Examples:**

- `command.dart` — Command pattern template
- `result.dart` — Result type for error handling
- `examples/` — Architecture usage examples

---

### Flutter Drift

**Directory:** `flutter-drift/`

**Description:** A complete guide to using the drift library for local storage in Flutter apps.

**When to use:**

- Building Flutter apps with a local SQLite database
- Needing type-safe queries
- Implementing reactive stream queries
- Database schema migrations
- Efficient CRUD operations
- Cross-platform support (mobile, web, desktop)

**Key capabilities:**

- Setup with the `drift_flutter` package
- StreamBuilder integration for reactive UI
- Provider/Riverpod patterns
- Platform-specific setup (mobile, web)
- In-memory database for testing
- Versioned schema migrations

**References:**

- `setup.md` — Flutter-specific setup
- `tables.md` — Table definitions
- `queries.md` — SELECT queries
- `writes.md` — INSERT, UPDATE, DELETE
- `streams.md` — Reactive streams
- `migrations.md` — Database migrations
- `flutter-ui.md` — Flutter UI integration

---

### Flutter Internationalization

**Directory:** `flutter-internationalization/`

**Description:** A complete guide to internationalizing Flutter apps using gen-l10n and intl.

**When to use:**

- Adding localization support to a Flutter app
- Translating UI text into multiple languages
- Formatting numbers and dates for different locales
- Configuring multilingual support for Material/Cupertino
- Implementing RTL (right-to-left) languages
- Managing ARB files and translations

**Approaches:**

**gen-l10n (recommended):**

- Modern, automated approach
- ARB files + code generation
- Best for new projects and teams

**intl package:**

- Manual control
- Code-based translations
- For simple or legacy projects

**Custom/Manual:**

- Maximum flexibility
- Map-based lookup
- Very simple apps

**Message types:**

- Simple messages
- With placeholders (parameters)
- Plural messages
- Select messages
- Number and date formatting

**References:**

- `l10n-config.md` — l10n.yaml configuration
- `arb-format.md` — ARB file format
- `number-date-formats.md` — Number and date formatting

**Examples:**

- `app_en.arb` — Example ARB file
- `l10n.yaml` — Configuration file

---

### Flutter Navigation

**Directory:** `flutter-navigation/`

**Description:** A comprehensive guide to navigation and routing in Flutter, including Navigator API, go_router, deep linking, and web navigation.

**When to use:**

- Implementing screen-to-screen navigation
- Configuring routing
- Setting up deep links (iOS, Android, Web)
- Handling browser history
- Managing navigation state
- Passing and returning data between screens

**Choosing an approach:**

**Navigator API (imperative):**

- Simple apps without deep linking
- Basic navigation stacks
- Rapid prototyping
- Moving from single-screen → multi-screen

**go_router (declarative, recommended):**

- Apps with deep linking
- Web apps with browser history
- Complex navigation patterns
- URL-based navigation
- Production apps

**Avoid Named Routes:**

- Not recommended by the Flutter team
- Limitations in deep-link customization
- No support for the browser forward button

**Common tasks:**

- Passing data between screens
- Returning data from screens
- Deep linking setup (Android, iOS, Web)
- Web URL strategy (hash vs path)
- Route guards (authentication)
- Nested routes
- Error handling (404)

**References:**

- `navigation-patterns.md` — Approach comparison
- `go_router-guide.md` — Detailed go_router guide
- `deep-linking.md` — Deep link setup
- `web-navigation.md` — Web-specific navigation

**Examples:**

- `navigator_basic.dart` — Basic Navigator
- `go_router_basic.dart` — Basic go_router
- `passing_data.dart` — Passing data
- `returning_data.dart` — Returning data

---

### Flutter Networking

**Directory:** `flutter-networking/`

**Description:** A comprehensive guide to networking in Flutter, including HTTP, WebSocket, authentication, and error handling.

**When to use:**

- Implementing HTTP requests (GET, POST, PUT, DELETE)
- WebSocket connections for real-time communication
- Authenticated requests with headers and tokens
- Background parsing with isolates
- REST API integration
- Handling network errors
- Optimizing networking performance

**HTTP methods:**

- **GET** — fetch data
- **POST** — create resources
- **PUT** — update resources
- **DELETE** — delete resources

**WebSocket:**

- Connections with `web_socket_channel`
- Stream-based messaging
- Real-time communication

**Authentication:**

- Bearer Token
- Basic Auth
- API Key
- Custom headers

**Error handling:**

- HTTP status codes
- Network exceptions
- Timeout handling
- Retry logic with exponential backoff

**Performance:**

- Background parsing with `compute()`
- Caching strategies
- Connection pooling
- Request throttling

**Architecture patterns:**

- Service Layer (HTTP endpoints)
- Repository Layer (caching, aggregation)
- Bloc/Cubit Layer (UI state transformation)

**References:**

- `http-basics.md` — HTTP CRUD operations
- `websockets.md` — WebSocket implementation
- `authentication.md` — Authentication strategies
- `error-handling.md` — Error handling patterns
- `performance.md` — Optimization

**Examples:**

- `fetch_example.dart` — GET request with FutureBuilder
- `post_example.dart` — POST request
- `websocket_example.dart` — WebSocket client
- `auth_example.dart` — Authenticated request
- `background_parsing.dart` — `compute()` for JSON

**Templates:**

- `http_service.dart` — HTTP service template
- `repository_template.dart` — Repository pattern template

---

### Flutter UI Constants

**Directory:** `flutter-ui-constants/`

**Description:** Centralized UI constants (design tokens) for Flutter apps: margins, border radii, font sizes, icon sizes, button sizes, elevations, breakpoints, and shared layout dimensions.

**When to use:**

- Removing magic numbers from UI widgets
- Building a shared spacing/typography system
- Standardizing dimensions across modules
- Migrating legacy UI to token-based constants
- Keeping layout values consistent for teams

**Key capabilities:**

- Full `KSize` class template with extensive constants
- Grouped constants by concern (spacing, typography, radius, icons, components)
- Reusable usage patterns for `Padding`, `TextStyle`, and container sizing
- Guidelines for naming and maintaining constants over time

**References:**

- `ksize-full-class.md` — Full `KSize` constants class template
- `constants-guidelines.md` — Organization and usage best practices

---

### Flutter Result and Cache

**Directory:** `flutter-result-cache/`

**Description:** A focused guide for implementing a generic `Result<V, E>` pattern and `BehaviorSubject`-based local cache in Flutter/Dart repositories.

**When to use:**

- Returning typed success/failure from repositories and use-cases
- Replacing exception-driven UI flow with explicit outcomes
- Building reactive in-memory cache streams
- Keeping latest cached value available for new subscribers
- Combining cache-first reads with remote refresh logic

**Key capabilities:**

- Full copy-ready `Result<V, E>` sealed implementation
- `BehaviorSubject<T>` cache setup for single-value and keyed maps
- Integration pattern: Result + subject updates in repositories
- Guidance for lifecycle safety (`close()` and immutable emissions)

**References:**

- `result-pattern.md` — Generic `Result<V, E>` implementation and usage
- `behavior-subject-cache.md` — Local cache patterns with `BehaviorSubject`
- `integration-repository-pattern.md` — Repository integration examples

---

### Flutter Web Environment

**Directory:** `flutter-web-environment/`

**Description:** Comprehensive guidance for Flutter Web setup and operations: project bootstrap, run/build flows, Wasm, dev server config, renderers, initialization customization, embedding, interop, testing, and release.

**When to use:**

- Enabling web support for new or existing Flutter apps
- Standardizing web run/build commands and CI paths
- Configuring `web_dev_config.yaml` (server, headers, proxy)
- Adopting Wasm and validating compatibility constraints
- Embedding Flutter into existing web apps (single-view or multi-view)

**Key capabilities:**

- Setup and device validation workflows
- `flutter run/build web` variants (including `--wasm`)
- `flutter_bootstrap.js` and loader customization patterns
- Web renderer/performance recommendations
- Embedded mode and multi-view architecture patterns

**References:**

- `setup-and-project-bootstrap.md` — Setup and enabling web
- `run-build-wasm-workflow.md` — Run/build commands and Wasm
- `web-dev-config-yaml.md` — Dev server centralized config
- `renderers-and-performance.md` — Renderer/performance notes
- `bootstrap-and-loader-customization.md` — Startup customization
- `embedding-modes-and-multiview.md` — Embedding and multi-view
- `interop-and-web-compatibility.md` — Interop compatibility
- `testing-debugging-and-release-checklist.md` — QA/release checks

---

### Flutter Slang Localization

**Directory:** `flutter-slang-localization/`

**Description:** Type-safe localization with Slang for Flutter apps, including `TranslationProvider`, locale handling, generated APIs, and CLI workflows.

**When to use:**

- Migrating from string-key localization to compile-time safe translations
- Managing multi-locale app translation files in JSON/YAML/CSV/ARB
- Integrating locale updates with Flutter widget rebuilds
- Running i18n analysis and normalization in CI

**Pinned versions:**

- `slang: ^4.13.0`
- `slang_flutter: ^4.13.0`

**References:**

- `setup-and-dependencies.md` — Dependencies and initial setup
- `flutter-integration.md` — MaterialApp + TranslationProvider wiring
- `generation-and-cli.md` — Generate/analyze/normalize/configure commands
- `locale-management.md` — Device/manual locale switching
- `slang-yaml-template.md` — Starter `slang.yaml`

---

### Flutter Theme, Context, and Localization

**Directory:** `flutter-theme-context-l10n/`

**Description:** Production patterns for Flutter app-shell setup: dark/light theming, `BuildContext` access extensions, and localization delegates configuration.

**When to use:**

- Building app root with theme + locale + route configuration
- Creating reusable `context` helpers for theme, colors, media-query, and keyboard
- Wiring localization delegates and supported locales in one place
- Supporting controlled light/dark switching across the app

**Key capabilities:**

- Context extension patterns for design-system access
- `MaterialApp` localization delegates and locale selection flow
- Explicit light/dark ThemeData architecture with ThemeMode
- Bootstrap composition combining theming, localization, and app wrappers

**References:**

- `context-theme-extensions.md` — BuildContext extension helpers
- `materialapp-localization-setup.md` — Delegates and locale setup
- `light-dark-theme-pattern.md` — Light/dark theme switching
- `app-bootstrap-pattern.md` — Full app-root composition

---

### Flutter Tooltips Patterns

**Directory:** `flutter-tooltips-patterns/`

**Description:** A practical guide for feature onboarding tooltips in Flutter using `OverlayEntry`, step-based flow with Cubit/Bloc, target `GlobalKey`s, and snapshot overlays.

**When to use:**

- Introducing new features with guided, multi-step tooltips
- Highlighting multiple controls in sequence
- Building reusable tooltip tours across screens
- Preventing route/timer race conditions in overlays

**Key capabilities:**

- Mixin-based orchestration for showing and finishing tooltip tours
- Snapshot capture flow for accurate target highlighting
- Tooltip bubble positioning and arrow alignment to target rects
- Safe lifecycle handling for timers, subscriptions, overlays, and image disposal

**References:**

- `overlay-tooltip-flow.md` — End-to-end overlay flow pattern
- `snapshot-overlay-pattern.md` — Snapshot capture and overlay strategy
- `wallet-tooltip-widget-pattern.md` — Tooltip bubble and arrow positioning

---

### Flutter Utils

**Directory:** `flutter-utils/`

**Description:** A practical utility toolkit for Flutter projects: launcher wrappers, reusable validators, input formatters, amount/currency formatting, context extensions, and country-code helpers.

**When to use:**

- Reducing duplicate helper logic across features
- Centralizing validation and formatting behavior
- Wrapping external-launch logic (web/mail/tel/map)
- Building reusable country and route-argument helpers

**Key capabilities:**

- URL launcher wrappers with fallback and logging
- Localized validator architecture for forms
- Phone-number input formatter and cleanup extensions
- Amount/currency formatting conventions in one utility
- Country-code indexing, lookup, filtering, and cache refresh patterns

**References:**

- `url-launcher-utils.md` — URL/mail/tel/map launch wrappers
- `common-validators.md` — Form validation architecture and rules
- `phone-number-format-utils.md` — Input formatter patterns
- `amount-formatter-utils.md` — Amount and currency formatting
- `context-extensions.md` — Typed route-arg extension
- `country-codes-helper.md` — Country helper and cache patterns

---

### Flutter Testing

**Directory:** `flutter-testing/`

**Description:** A comprehensive guide to testing Flutter apps: unit, widget, and integration tests.

**When to use:**

- Writing unit tests for functions/methods/classes
- Creating widget tests to validate UI components
- Building integration tests for end-to-end coverage
- Mocking dependencies and plugin interactions
- Debugging common testing issues
- Testing Flutter plugins with native code
- Running tests in different build modes

**Test types:**

**Unit Tests:**

- Testing individual functions/classes
- Mocking external dependencies
- Avoiding disk I/O and UI rendering
- Fast execution, high maintainability

**Widget Tests:**

- Testing UI widgets
- Verifying user interactions
- Testing different orientations
- Validating state changes

**Integration Tests:**

- Testing full user flows
- Covering multiple screens/pages
- Testing navigation
- Performance profiling

**Trade-offs:**

|                  | Unit   | Widget | Integration |
|------------------|--------|--------|-------------|
| Confidence       | Low    | Higher | Highest     |
| Maintenance cost | Low    | Higher | Highest     |
| Execution speed  | Quick  | Quick  | Slow        |

**Working with plugins:**

- Mocking platform channels
- Testing app code that depends on plugins
- Testing plugins themselves
- Native code testing

**Common issues:**

- RenderFlex overflow
- Unbounded height/width
- setState during build
- Plugin crashes in tests

**Build Modes:**

- **Debug** — development with hot reload
- **Profile** — performance analysis
- **Release** — deployment (assertions disabled)

**Best practices:**

- Test Pyramid (more unit/widget, fewer integration)
- Descriptive test names
- Arrange–Act–Assert structure
- Test independence
- Mock external dependencies
- CI automation

**References:**

- `unit-testing.md` — Unit tests and mocking
- `widget-testing.md` — Widget finding and interactions
- `integration-testing.md` — End-to-end testing
- `mocking.md` — Dependency mocking
- `common-errors.md` — Fixes for common issues
- `plugin-testing.md` — Plugin testing

---

### Flutter Backend-driven UI with Duit

**Directory:** `flutter-duit-bdui/`

**Description:** A comprehensive guide to integrating the BDUI framework [flutter_duit](https://pub.dev/packages/flutter_duit) into Flutter apps.

**When to use:**

- Integrating flutter_duit into a project
- Creating and registering custom widgets
- Registering components
- Overriding core framework behavior by implementing capabilities
- Needing reference information about the framework’s public API

**References:**

- [capabilities.md](./flutter-duit-bdui/references/capabiliteis.md) — Notes on capability-based design and overriding core framework parts.
- [troubleshooting.md](./flutter-duit-bdui/references/troubleshooting.md) — Notes on common framework integration issues.
- [environvent_vars.md](./flutter-duit-bdui/references//environment_vars.md) — Notes on available environment variables and how to use them.
- [public_api.md](./flutter-duit-bdui/references/public_api.md) — Notes on the driver’s public API.
- <https://duit.pro/docs/en> — Official documentation website

## File structure 📁

Each skill is organized as follows:

```
skill-name/
├── SKILL.md              # Main skill description
├── references/           # Reference documentation
│   ├── topic1.md
│   ├── topic2.md
│   └── ...
├── assets/              # Code examples and templates
│   ├── examples/
│   ├── templates/
│   └── ...
└── scripts/            # Helper scripts (optional)
```

## How to use 🚀

This repository follows the open [Agent Skills](https://agentskills.io/home) format — a standard for giving AI agents new capabilities and expertise. Agent Skills are folders with instructions, scripts, and resources that agents can discover and use to complete tasks more accurately and efficiently.

### Compatibility

Skills from this repository can be used by any AI assistants that support the Agent Skills format, including:

- Anthropic Claude (with Agent Skills support)
- Cursor IDE
- Other compatible development tools

### Benefits of Agent Skills

**For skill authors:**

- Create a skill once and use it across many AI tools
- Version control with Git
- Portability across projects and teams

**For teams and organizations:**

- Capturing organizational knowledge in a structured format
- Standardizing development approaches
- Reusing best practices

**For AI agents:**

- An extendable knowledge base without retraining
- Context-dependent expertise
- Repeatable workflows

## Skills application matrix 📊

| Task | Skill | When to use |
|--------|-------|-------------------|
| AGENTS.md / repository context | agents-md-generator | Creating/updating AGENTS.md, monorepo structure |
| Local DB (Dart) | dart-drift | CLI, server-side, non-Flutter desktop |
| Local DB (Flutter) | flutter-drift | Flutter apps, mobile/web/desktop |
| Adaptive UI | flutter-adaptive-ui | Multi-platform, responsive layouts |
| Animations | flutter-animations | Motion effects, transitions |
| Project architecture | flutter-architecture | Bloc/Cubit, feature-first, scalable structure |
| Internationalization | flutter-internationalization | Localization, translations, i18n |
| Navigation | flutter-navigation | Routing, deep linking, screen transitions |
| Backend-driven UI (BDUI) | flutter-duit-bdui | DUIT, server-driven UI, backend-driven screens |
| Networking | flutter-networking | HTTP, WebSocket, REST API |
| Web environment | flutter-web-environment | Setup, wasm, renderers, embedding, web config |
| Result + local cache | flutter-result-cache | Typed success/failure, BehaviorSubject cache |
| Slang localization | flutter-slang-localization | Type-safe i18n, generator, locale management |
| Theme + context + l10n | flutter-theme-context-l10n | Dark/light theme, delegates, context extensions |
| Feature tooltips | flutter-tooltips-patterns | Overlay tours, snapshots, step-by-step hints |
| Shared utilities | flutter-utils | Validators, formatters, launchers, country helpers |
| UI constants / design tokens | flutter-ui-constants | Spacing, typography, radii, layout sizes |
| Testing | flutter-testing | Unit, widget, integration tests |

## License 📝

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

## Contributing 🤝

Contributions are welcome! Please:

- Follow the [Agent Skills specification](https://agentskills.io/specification)
- Follow the existing skill structure in the repository
- Add practical examples to `assets/`
- Document usage conditions in `SKILL.md`
- Include best practices and reference materials in `references/`
- Use metadata in the `SKILL.md` frontmatter

## Additional resources 📚

### Agent Skills

- [Agent Skills — Official website](https://agentskills.io/home)
- [Agent Skills format specification](https://agentskills.io/specification)
- [Agent Skills integration](https://agentskills.io/integrate-skills)
- [Agent Skills on GitHub](https://github.com/agentskills/agentskills)

---

**Version:** 1.0  
**Last updated:** January 2026
