# auto_route Guide

## Overview

auto_route provides typed navigation for Flutter using code generation. It is useful when you need:
- Compile-time safe route arguments
- Nested routers and tabs with less manual boilerplate
- Route guards for auth/permissions
- Deep-link support across mobile and web

## Versions

- `auto_route: ^11.1.0`
- `auto_route_generator: ^10.2.3` (latest 10.x line)
- `build_runner` for generation

## Install

```yaml
dependencies:
  auto_route: ^11.1.0

dev_dependencies:
  auto_route_generator: ^10.2.3
  build_runner: ^2.4.0
```

Or via command:

```bash
flutter pub add auto_route dev:auto_route_generator dev:build_runner
```

## Minimal Setup

1. Create router config:

```dart
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: DetailsRoute.page),
  ];
}
```

2. Annotate pages:

```dart
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
```

3. Generate routes:

```bash
dart run build_runner build
```

4. Wire app:

```dart
final appRouter = AppRouter();

MaterialApp.router(
  routerConfig: appRouter.config(),
);
```

## Common Navigation

```dart
context.router.push(const DetailsRoute(id: 42));
context.router.replace(const HomeRoute());
context.router.navigate(const HomeRoute());
context.router.pop();
```

## Route Guards

Use `AutoRouteGuard` to block/redirect routes, for example auth-protected pages.

## Deep Linking

Use `deepLinkTransformer` and `deepLinkBuilder` in `router.config(...)` to validate or transform incoming links.

## LeanBuilder (Optional)

For faster incremental generation, add:

```yaml
dev_dependencies:
  auto_route_generator: ^10.2.3
  lean_builder: ^0.1.0
```

Then run:

```bash
dart run lean_builder build
# or
dart run lean_builder watch
```

If you want LeanBuilder only, disable auto_route generator in `build.yaml` under your targets.
