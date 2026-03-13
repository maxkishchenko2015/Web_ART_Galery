import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';

class AppLocaleCubit extends HydratedCubit<AppLocale> {
  AppLocaleCubit() : super(AppLocale.ru) {
    unawaited(LocaleSettings.setLocale(state));
  }

  void setLocale(AppLocale locale) {
    if (state == locale) {
      return;
    }

    emit(locale);
    unawaited(LocaleSettings.setLocale(locale));
  }

  @override
  AppLocale fromJson(Map<String, dynamic> json) {
    final rawLocale = json['locale'] as String?;
    if (rawLocale == null) {
      return AppLocale.ru;
    }

    try {
      return AppLocaleUtils.parse(rawLocale);
    } catch (_) {
      return AppLocale.ru;
    }
  }

  @override
  Map<String, dynamic> toJson(AppLocale state) => <String, dynamic>{'locale': state.languageCode};
}
