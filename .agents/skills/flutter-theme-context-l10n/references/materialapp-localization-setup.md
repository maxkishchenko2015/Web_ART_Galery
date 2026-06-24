# MaterialApp Localization Setup

Configure localization once at app root using `supportedLocales` and delegates.

## Required delegates

```dart
localizationsDelegates: const [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
```

## Locale wiring pattern

```dart
MaterialApp(
  supportedLocales: supportedLocales,
  localizationsDelegates: const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  locale: currentLocale ?? defaultLocale,
)
```

## Runtime locale changes

- Keep current locale in app state (`State`, notifier, or Bloc/Cubit).
- On language-change event, update locale state and rebuild app root.
- Trigger delegate load if your localization package requires explicit loading.

## Best practices

- Always include all three Flutter localization delegates.
- Keep locale fallback deterministic (default language code).
- Ensure `supportedLocales` comes from one centralized provider.
