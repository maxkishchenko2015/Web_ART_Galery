import 'package:flutter/material.dart';
import 'package:web_art_galery/src/shared/config/app_text_styles.dart';

/// Design-system access helpers on [BuildContext].
///
/// Standard theme shortcuts:
/// ```dart
/// context.theme        // ThemeData
/// context.textTheme    // TextTheme (light surface)
/// context.colorScheme  // ColorScheme
/// ```
///
/// Shell (dark-surface) typography:
/// ```dart
/// context.textOnDark      // active / selected variant — white
/// context.textOnDarkDim   // inactive / default variant — white 70 %
/// ```
extension BuildContextThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension BuildContextShellTextX on BuildContext {
  /// Active / selected text on a dark shell surface — full [AppColors.onDark].
  ShellTextTheme get textOnDark => const ShellTextTheme.active();

  /// Inactive / default text on a dark shell surface — [AppColors.onDarkBody].
  ShellTextTheme get textOnDarkDim => const ShellTextTheme.dim();
}

extension BuildContextContentTextX on BuildContext {
  /// Text styles for light-surface content pages (features, biography, stats).
  ContentTextTheme get textContent => const ContentTextTheme();
}
