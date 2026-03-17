import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/platform/page_title/page_title.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLocaleCubit, AppLocale>(
      builder: (context, currentLocale) {
        final locales = _orderedLocales(context, currentLocale);

        return MenuAnchor(
          style: MenuStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColors.onDarkPanel),
            surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
            shadowColor: const WidgetStatePropertyAll(Color(0x44000000)),
            elevation: const WidgetStatePropertyAll(14),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(KSize.margin1x)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(KSize.radiusDefaultLarge),
                side: const BorderSide(color: AppColors.onDarkPanelBorder),
              ),
            ),
          ),
          onOpen: () => setState(() => _isOpen = true),
          onClose: () => setState(() => _isOpen = false),
          menuChildren: [
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 220, maxWidth: 260),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int index = 0; index < locales.length; index++) ...[
                    _LocaleMenuItem(
                      label: _label(context, locales[index]),
                      selected: locales[index] == currentLocale,
                      onTap: () {
                        if (locales[index] == currentLocale) {
                          MenuController.maybeOf(context)?.close();
                          return;
                        }

                        context.read<AppLocaleCubit>().setLocale(locales[index]);
                        setPageTitle(t.app.title);
                        MenuController.maybeOf(context)?.close();
                      },
                    ),
                    if (index == 0 && locales.length > 1)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: KSize.margin2x),
                        child: Divider(color: AppColors.onDarkPanelBorder, height: 1),
                      ),
                  ],
                ],
              ),
            ),
          ],
          builder: (context, controller, child) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (_isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOutCubic,
                  padding: const EdgeInsets.symmetric(
                    horizontal: KSize.margin3x,
                    vertical: KSize.margin1Halfx,
                  ),
                  decoration: BoxDecoration(
                    color: _isOpen ? AppColors.onDarkOverlay : Colors.transparent,
                    borderRadius: BorderRadius.circular(KSize.radiusDefaultLarge),
                    border: Border.all(
                      color: _isOpen ? AppColors.onDarkDivider : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.language_rounded, size: 17, color: AppColors.onDarkMuted),
                      const SizedBox(width: KSize.margin1Halfx),
                      Text(context.t.language.label, style: context.textOnDarkDim.languageLabel),
                      const SizedBox(width: KSize.margin2x),
                      Text(_label(context, currentLocale), style: context.textOnDark.languageValue),
                      const SizedBox(width: KSize.margin1x),
                      AnimatedRotation(
                        turns: _isOpen ? 0.5 : 0,
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOutCubic,
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18,
                          color: AppColors.onDarkMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<AppLocale> _orderedLocales(BuildContext context, AppLocale currentLocale) {
    final others = AppLocale.values.where((locale) => locale != currentLocale).toList()
      ..sort((a, b) => _label(context, a).compareTo(_label(context, b)));

    return [currentLocale, ...others];
  }

  String _label(BuildContext context, AppLocale locale) {
    return switch (locale) {
      AppLocale.ru => context.t.language.russian,
      AppLocale.en => context.t.language.english,
      AppLocale.es => context.t.language.spanish,
      AppLocale.fr => context.t.language.french,
      AppLocale.de => context.t.language.german,
      AppLocale.be => context.t.language.belarusian,
    };
  }
}

class _LocaleMenuItem extends StatelessWidget {
  const _LocaleMenuItem({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(KSize.radiusDefaultMedium),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin3x, vertical: KSize.margin4x),
          decoration: BoxDecoration(
            color: selected ? AppColors.onDarkPanelActive : Colors.transparent,
            borderRadius: BorderRadius.circular(KSize.radiusDefault),
          ),
          child: Row(
            children: [
              Expanded(child: Text(label, style: context.textOnDark.languageMenuItem(selected))),
              AnimatedOpacity(
                opacity: selected ? 1 : 0,
                duration: const Duration(milliseconds: 160),
                child: const Icon(Icons.check_circle_rounded, size: 16, color: AppColors.onDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
