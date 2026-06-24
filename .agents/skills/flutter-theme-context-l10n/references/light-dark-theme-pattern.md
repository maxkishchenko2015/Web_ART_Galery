# Light/Dark Theme Pattern

Maintain explicit light and dark `ThemeData` and switch through `ThemeMode`.

## App-level pattern

```dart
ValueListenableBuilder<ThemeMode>(
  valueListenable: themeNotifier,
  builder: (context, mode, _) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: mode,
    );
  },
)
```

## Theme construction

- Build `lightTheme` and `darkTheme` from one shared design system.
- Keep brand overrides centralized (for example, same accent/secondary across both).
- Use extension-based access for custom palettes.

## Practical recommendations

- Provide both themes in production, even if dark is temporarily constrained.
- Avoid building theme objects inside frequently rebuilt widgets.
- Keep typography and component themes consistent between modes.
