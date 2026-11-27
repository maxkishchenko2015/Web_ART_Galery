import 'package:material_ui/material_ui.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';

/// Site color palettes the visitor can switch between.
enum AppPalette {
  /// Dark olive shell, warm parchment pages, terracotta accent (default).
  parchment,

  /// White pages and shell, ink text, burgundy accent.
  classic,

  /// Deep navy pages and shell, light text, gold accent.
  night;

  AppDesignColors get colors => switch (this) {
    AppPalette.parchment => AppDesignColors.parchmentPalette,
    AppPalette.classic => AppDesignColors.classicPalette,
    AppPalette.night => AppDesignColors.nightPalette,
  };

  Brightness get brightness => this == AppPalette.night ? Brightness.dark : Brightness.light;
}
