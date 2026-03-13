# Locale Management

## Use device locale

```dart
LocaleSettings.useDeviceLocale();
```

## Set explicit locale

```dart
LocaleSettings.setLocale(AppLocale.en);
// or
LocaleSettings.setLocaleRaw('en');
```

## Listen to locale changes

```dart
LocaleSettings.getLocaleStream().listen((locale) {
  // react to locale updates
});
```

## Rebuild behavior

- Prefer `Translations.of(context)` or `context.t` in widgets.
- Wrap app with `TranslationProvider` for automatic rebuilds.
