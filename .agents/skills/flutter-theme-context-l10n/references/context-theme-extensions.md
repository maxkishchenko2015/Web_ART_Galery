# Context Theme Extensions

Use a single `BuildContext` extension to expose frequently used design-system and media-query values.

## Recommended accessors

- `theme`, `textTheme`
- `colors` (`ColorScheme`)
- extended/custom color scheme (`extendedColors`)
- `height`, `width`, `viewInsets`
- safe bottom padding helpers for pages and bottom sheets

## Minimal pattern

```dart
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  void hideKeyboard() => FocusScope.of(this).unfocus();
}
```

## Safe-area helper pattern

- Use a helper that returns either safe-area bottom or default spacing.
- For keyboard-sensitive layouts, prefer `viewPadding`-based calculations where needed.

## Practical rules

- Keep extension method names short and stable.
- Avoid heavy computation inside extension getters.
- Document edge cases (keyboard animation, bottom sheets, platform differences).
