# slang.yaml Template

```yaml
base_locale: en
input_directory: lib/i18n
input_file_pattern: .i18n.json
flutter_integration: true
locale_handling: true
lazy: true
fallback_strategy: base_locale
translate_var: t
enum_name: AppLocale
class_name: Translations
```

## Optional tweaks

- `namespaces: true` for split files by namespace.
- `string_interpolation: braces` if project conventions require `{name}`.
- `format.enabled: true` for generated-code formatting.
