import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';

class AppLocaleState {
  const AppLocaleState({required this.locale, this.isLanguageMenuOpen = false});

  final AppLocale locale;
  final bool isLanguageMenuOpen;

  AppLocaleState copyWith({AppLocale? locale, bool? isLanguageMenuOpen}) {
    return AppLocaleState(
      locale: locale ?? this.locale,
      isLanguageMenuOpen: isLanguageMenuOpen ?? this.isLanguageMenuOpen,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AppLocaleState &&
        other.locale == locale &&
        other.isLanguageMenuOpen == isLanguageMenuOpen;
  }

  @override
  int get hashCode => Object.hash(locale, isLanguageMenuOpen);
}

class AppLocaleCubit extends HydratedCubit<AppLocaleState> {
  // First-visit default: match the browser/device preferred language against
  // our supported locales, falling back to the base locale (ru) when none fit.
  // A returning user's explicit choice is restored by [fromJson] and overrides
  // this seed, so device detection only applies before any choice was saved.
  AppLocaleCubit() : super(AppLocaleState(locale: AppLocaleUtils.findDeviceLocale())) {
    unawaited(LocaleSettings.setLocale(state.locale));
  }

  void setLocale(AppLocale locale) {
    if (state.locale == locale) {
      closeLanguageMenu();
      return;
    }

    emit(state.copyWith(locale: locale, isLanguageMenuOpen: false));
    unawaited(LocaleSettings.setLocale(locale));
  }

  void openLanguageMenu() {
    if (state.isLanguageMenuOpen) {
      return;
    }

    emit(state.copyWith(isLanguageMenuOpen: true));
  }

  void closeLanguageMenu() {
    if (!state.isLanguageMenuOpen) {
      return;
    }

    emit(state.copyWith(isLanguageMenuOpen: false));
  }

  void toggleLanguageMenu() {
    emit(state.copyWith(isLanguageMenuOpen: !state.isLanguageMenuOpen));
  }

  @override
  AppLocaleState fromJson(Map<String, dynamic> json) {
    final rawLocale = json['locale'] as String?;
    if (rawLocale == null) {
      return AppLocaleState(locale: AppLocaleUtils.findDeviceLocale());
    }

    try {
      return AppLocaleState(locale: AppLocaleUtils.parse(rawLocale));
    } catch (_) {
      return AppLocaleState(locale: AppLocaleUtils.findDeviceLocale());
    }
  }

  @override
  Map<String, dynamic> toJson(AppLocaleState state) => <String, dynamic>{
    'locale': state.locale.languageCode,
  };
}
