import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/platform/page_title/page_title.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLocaleCubit, AppLocale>(
      builder: (context, currentLocale) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.t.language.label),
            const SizedBox(width: KSize.margin2x),
            DropdownButtonHideUnderline(
              child: DropdownButton<AppLocale>(
                value: currentLocale,
                items: [
                  for (final locale in AppLocale.values)
                    DropdownMenuItem<AppLocale>(
                      value: locale,
                      child: Text(_label(context, locale)),
                    ),
                ],
                onChanged: (locale) {
                  if (locale == null) {
                    return;
                  }

                  context.read<AppLocaleCubit>().setLocale(locale);
                  setPageTitle(t.app.title);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  String _label(BuildContext context, AppLocale locale) {
    return switch (locale) {
      AppLocale.ru => context.t.language.russian,
      AppLocale.en => context.t.language.english,
      AppLocale.es => context.t.language.spanish,
      AppLocale.fr => context.t.language.french,
      AppLocale.de => context.t.language.german,
    };
  }
}
