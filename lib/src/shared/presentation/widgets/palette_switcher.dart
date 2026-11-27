import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/app_palette.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_palette_cubit.dart';

String paletteLabel(Translations t, AppPalette palette) => switch (palette) {
  AppPalette.parchment => t.palette.parchment,
  AppPalette.classic => t.palette.classic,
  AppPalette.night => t.palette.night,
};

/// Round swatch of a palette: shell, page and accent colors as thirds.
class PaletteSwatch extends StatelessWidget {
  const PaletteSwatch({
    super.key,
    required this.palette,
    this.size = KSize.paletteSwatchSize,
    this.selected = false,
  });

  final AppPalette palette;
  final double size;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final p = palette.colors;
    final ring = context.colors.onDarkMuted;

    return AnimatedContainer(
      duration: KSize.durationFast,
      width: size,
      height: size,
      padding: EdgeInsets.all(selected ? KSize.marginHalf : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? context.colors.terracottaLight : ring,
          width: selected ? KSize.borderWidthSmall : KSize.borderWidthVerySmall,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: SweepGradient(
            colors: [p.shell, p.shell, p.parchment, p.parchment, p.terracotta, p.terracotta],
            stops: const [0, 1 / 3, 1 / 3, 2 / 3, 2 / 3, 1],
          ),
        ),
      ),
    );
  }
}

/// Header button showing the current palette; opens a menu with all three.
class PaletteMenuButton extends StatelessWidget {
  const PaletteMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final current = context.watch<AppPaletteCubit>().state.palette;
    final cubit = context.read<AppPaletteCubit>();

    return MenuAnchor(
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
      menuChildren: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            KSize.margin3x,
            KSize.margin2x,
            KSize.margin3x,
            KSize.margin1x,
          ),
          child: Text(context.t.palette.title, style: context.textOnDark.languageLabel),
        ),
        for (final palette in AppPalette.values)
          _PaletteMenuItem(
            palette: palette,
            selected: palette == current,
            onTap: () => cubit.select(palette),
          ),
      ],
      builder: (context, controller, _) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => controller.isOpen ? controller.close() : controller.open(),
          child: Semantics(
            button: true,
            label: context.t.palette.title,
            child: Padding(
              padding: const EdgeInsets.all(KSize.margin2x),
              child: PaletteSwatch(palette: current),
            ),
          ),
        ),
      ),
    );
  }
}

class _PaletteMenuItem extends StatelessWidget {
  const _PaletteMenuItem({required this.palette, required this.selected, required this.onTap});

  final AppPalette palette;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MenuItemButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          selected ? colors.onDarkPanelActive : Colors.transparent,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(KSize.radiusDefault)),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: KSize.margin3x, vertical: KSize.margin3x),
        ),
      ),
      leadingIcon: PaletteSwatch(palette: palette, size: KSize.iconM),
      trailingIcon: AnimatedOpacity(
        opacity: selected ? 1 : 0,
        duration: KSize.durationShort,
        child: Icon(Icons.check_circle_rounded, size: KSize.iconS, color: colors.onDark),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: KSize.paletteMenuMinWidth),
        child: Text(
          paletteLabel(context.t, palette),
          style: context.textOnDark.languageMenuItem(selected),
        ),
      ),
    );
  }
}

/// Inline row of the three palette swatches with a caption — for the mobile
/// drawer and the footer, where a popup menu would be overkill.
class PaletteSwatchRow extends StatelessWidget {
  const PaletteSwatchRow({super.key, this.showCaption = true});

  final bool showCaption;

  @override
  Widget build(BuildContext context) {
    final current = context.watch<AppPaletteCubit>().state.palette;
    final cubit = context.read<AppPaletteCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showCaption) ...[
          Text(context.t.palette.title, style: context.textOnDark.footerHeading),
          const SizedBox(height: KSize.margin3x),
        ],
        Wrap(
          spacing: KSize.margin3x,
          runSpacing: KSize.margin2x,
          children: [
            for (final palette in AppPalette.values)
              Semantics(
                button: true,
                selected: palette == current,
                label: paletteLabel(context.t, palette),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => cubit.select(palette),
                    child: PaletteSwatch(
                      palette: palette,
                      size: KSize.paletteSwatchSizeLarge,
                      selected: palette == current,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
