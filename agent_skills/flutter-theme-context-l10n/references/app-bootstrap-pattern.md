# App Bootstrap Pattern

Combine theme, locale, routing, and app-wide wrappers in one predictable root composition.

## Root composition outline

1. Resolve `ThemeMode` from notifier/state.
2. Resolve current locale from profile/device/default fallback.
3. Build `MaterialApp` with themes, delegates, supported locales, routes.
4. Wrap child in global builder helpers (text-scale clamp, connection guard, overlays).

## Skeleton

```dart
MaterialApp(
  supportedLocales: supportedLocales,
  localizationsDelegates: const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  locale: currentLocale,
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: themeMode,
  routes: routes,
  builder: (context, child) {
    final safeChild = MediaQuery.withClampedTextScaling(
      maxScaleFactor: 1,
      child: child!,
    );
    return AppConnectivityGuard(child: safeChild);
  },
)
```

## Event-driven updates

- Listen for language change events and update locale state.
- Listen for app-version/feature-flag events and route accordingly.
- Keep side-effects in app-state handlers, not inside UI leaf widgets.
