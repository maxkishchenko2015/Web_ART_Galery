# Page Title and App Switcher

Use platform-aware utilities to keep app titles consistent across web and mobile.

## Mobile app-switcher title pattern

```dart
void setPageTitle(BuildContext context) {
  SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(
      label: AppConfig.appName,
      primaryColor: Theme.of(context).colorScheme.primary.toARGB32(),
    ),
  );
}
```

## Web page title pattern

For Wasm-friendly web interop, prefer `package:web`:

```dart
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

void setBrowserPageTitle(String title) {
  if (!kIsWeb) return;
  web.document.title = title;
}
```

## Unified utility example

```dart
void setUnifiedTitle(BuildContext context, String title) {
  if (kIsWeb) {
    web.document.title = title;
    return;
  }

  SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(
      label: title,
      primaryColor: Theme.of(context).colorScheme.primary.toARGB32(),
    ),
  );
}
```

## Notes

- `ApplicationSwitcherDescription` affects Android task switcher metadata.
- Browser tab title should be updated on route/screen changes for better UX and SEO context.
