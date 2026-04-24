import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
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
  final MenuController _menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLocaleCubit, AppLocaleState>(
      builder: (context, state) {
        final colors = context.colors;
        final currentLocale = state.locale;
        final locales = _orderedLocales(context, currentLocale);
        final localeCubit = context.read<AppLocaleCubit>();

        return MenuAnchor(
          controller: _menuController,
          style: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(colors.onDarkPanel),
            surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
            shadowColor: WidgetStatePropertyAll(colors.overlayShadow),
            elevation: const WidgetStatePropertyAll(14),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(KSize.margin1x)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(KSize.radiusDefaultLarge),
                side: BorderSide(color: colors.onDarkPanelBorder),
              ),
            ),
          ),
          onOpen: localeCubit.openLanguageMenu,
          onClose: localeCubit.closeLanguageMenu,
          menuChildren: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: KSize.floatingMenuMinWidth,
                maxWidth: KSize.floatingMenuMaxWidth,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final (index, locale) in locales.indexed) ...[
                    _LocaleMenuItem(
                      label: _label(context, locale),
                      selected: locale == currentLocale,
                      onTap: () {
                        if (locale == currentLocale) {
                          _menuController.close();
                          localeCubit.closeLanguageMenu();
                          return;
                        }

                        localeCubit.setLocale(locale);
                        setPageTitle(t.app.title);
                        _menuController.close();
                      },
                    ),
                    if (index == 0 && locales.length > 1)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: KSize.margin2x),
                        child: Divider(
                          color: colors.onDarkPanelBorder,
                          height: KSize.borderWidthVerySmall,
                        ),
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
                  if (state.isLanguageMenuOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: AnimatedContainer(
                  duration: KSize.durationStandard,
                  curve: Curves.easeOutCubic,
                  padding: const EdgeInsets.symmetric(
                    horizontal: KSize.margin3x,
                    vertical: KSize.margin1Halfx,
                  ),
                  decoration: BoxDecoration(
                    color: state.isLanguageMenuOpen ? colors.onDarkOverlay : Colors.transparent,
                    borderRadius: BorderRadius.circular(KSize.radiusDefaultLarge),
                    border: Border.all(
                      color: state.isLanguageMenuOpen ? colors.onDarkDivider : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.language_rounded, size: KSize.iconSM, color: colors.onDarkMuted),
                      const SizedBox(width: KSize.margin1Halfx),
                      Text(context.t.language.label, style: context.textOnDarkDim.languageLabel),
                      const SizedBox(width: KSize.margin2x),
                      Text(_label(context, currentLocale), style: context.textOnDark.languageValue),
                      const SizedBox(width: KSize.margin1x),
                      _LanguageMenuIndicator(isOpen: state.isLanguageMenuOpen),
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

class _LanguageMenuIndicator extends StatelessWidget {
  const _LanguageMenuIndicator({required this.isOpen});

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: KSize.indicatorBox,
      height: KSize.indicatorBox,
      child: AnimatedSwitcher(
        duration: KSize.durationMedium,
        reverseDuration: KSize.durationShort,
        switchInCurve: Curves.easeOutBack,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          final slideAnimation = Tween<Offset>(
            begin: const Offset(0, 0.2),
            end: Offset.zero,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: slideAnimation,
              child: ScaleTransition(scale: animation, child: child),
            ),
          );
        },
        child: Icon(
          isOpen ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
          key: ValueKey(isOpen),
          size: KSize.iconSMedium,
          color: colors.onDarkMuted,
        ),
      ),
    );
  }
}

class _LocaleMenuItem extends StatelessWidget {
  const _LocaleMenuItem({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(KSize.radiusDefaultMedium),
        onTap: onTap,
        child: AnimatedContainer(
          duration: KSize.durationShort,
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin3x, vertical: KSize.margin4x),
          decoration: BoxDecoration(
            color: selected ? colors.onDarkPanelActive : Colors.transparent,
            borderRadius: BorderRadius.circular(KSize.radiusDefault),
          ),
          child: Row(
            children: [
              Expanded(child: Text(label, style: context.textOnDark.languageMenuItem(selected))),
              AnimatedOpacity(
                opacity: selected ? 1 : 0,
                duration: KSize.durationShort,
                child: Icon(Icons.check_circle_rounded, size: KSize.iconS, color: colors.onDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
