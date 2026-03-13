import 'dart:collection';

import 'package:flutter/material.dart';

abstract interface class SupportedLocales {
  UnmodifiableListView<Locale> get locales;
}

abstract interface class SupportedLocalesNotifier implements SupportedLocales, ChangeNotifier {}

class DefaultSupportedLocalesNotifier extends ChangeNotifier implements SupportedLocalesNotifier {
  DefaultSupportedLocalesNotifier(List<Locale> initialLocales)
    : assert(initialLocales.isNotEmpty, 'At least one locale is required.'),
      _locales = UnmodifiableListView<Locale>(List<Locale>.unmodifiable(initialLocales));

  UnmodifiableListView<Locale> _locales;

  @override
  UnmodifiableListView<Locale> get locales => _locales;

  void updateLocales(List<Locale> nextLocales) {
    if (nextLocales.isEmpty) {
      return;
    }

    _locales = UnmodifiableListView<Locale>(List<Locale>.unmodifiable(nextLocales));
    notifyListeners();
  }
}

class SupportedLocalesProvider extends InheritedNotifier<SupportedLocalesNotifier> {
  const SupportedLocalesProvider({super.key, required super.notifier, required super.child});

  static SupportedLocales of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<SupportedLocalesProvider>();
    assert(provider != null, 'SupportedLocalesProvider is missing in widget tree.');

    return provider!.notifier!;
  }
}
