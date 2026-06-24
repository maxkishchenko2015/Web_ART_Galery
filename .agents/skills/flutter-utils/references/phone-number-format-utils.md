# Phone Number Format Utils

Use formatter utilities to keep phone input behavior consistent across screens.

## Formatter pattern

```dart
static List<TextInputFormatter> inputFormatters() {
  return [
    FilteringTextInputFormatter.deny(RegExp(' ')),
    FilteringTextInputFormatter.allow(RegExp(r'(\\d|\\+)')),
    FilteringTextInputFormatter.deny(RegExp('^0*')),
  ];
}
```

## Controller extension pattern

Use an extension to perform country-code cleanup and cursor-safe updates.

```dart
extension PhoneCleanExt on TextEditingController {
  void cleanCountryCode(String selectedCountryCode) {
    final normalizedCode = selectedCountryCode.replaceAll('+', '');
    if (text.startsWith('+$normalizedCode')) {
      text = text.substring(normalizedCode.length + 1);
    } else if (text.startsWith(normalizedCode)) {
      text = text.substring(normalizedCode.length);
    }
    selection = TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
```

## Best practices

- Keep formatter lists in one utility class.
- Always restore selection after text mutation.
- Unit test edge cases for pasted values and leading symbols.
