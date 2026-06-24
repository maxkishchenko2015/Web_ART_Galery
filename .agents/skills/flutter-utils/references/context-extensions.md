# Context Extensions

Typed context extensions reduce route-argument casting boilerplate.

## Typed args pattern

```dart
extension ContextExtensions on BuildContext {
  T? args<T>() {
    final route = ModalRoute.of(this);
    if (route == null) return null;
    final value = route.settings.arguments;
    return value is T ? value : null;
  }
}
```

## Best practices

- Keep extension methods null-safe.
- Avoid throw-on-mismatch in shared helpers.
- Use explicit DTO types for route args in medium/large features.
