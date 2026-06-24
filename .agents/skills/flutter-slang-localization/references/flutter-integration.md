# Flutter Integration

## main.dart

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(child: const MyApp()));
}
```

## MaterialApp wiring

```dart
MaterialApp(
  locale: TranslationProvider.of(context).flutterLocale,
  supportedLocales: AppLocaleUtils.supportedLocales,
  localizationsDelegates: GlobalMaterialLocalizations.delegates,
)
```

## Access translations

```dart
import 'package:my_app/i18n/strings.g.dart';

final t = Translations.of(context);
final title = t.mainScreen.title;
final viaContext = context.t.mainScreen.title;
```
