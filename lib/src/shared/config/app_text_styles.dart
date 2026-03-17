import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Named text styles for the navigation shell (dark surfaces: header, drawer,
/// footer).
///
/// Two pre-built variants are exposed via [BuildContext] extensions:
/// ```dart
/// context.textOnDark      // active / selected  — [AppColors.onDark]
/// context.textOnDarkDim   // inactive / default — [AppColors.onDarkBody]
/// ```
///
/// Example:
/// ```dart
/// style: selected ? context.textOnDark.navLink : context.textOnDarkDim.navLink
/// ```
@immutable
class ShellTextTheme {
  const ShellTextTheme.active() : _onColor = AppColors.onDark;
  const ShellTextTheme.dim() : _onColor = AppColors.onDarkBody;

  final Color _onColor;

  // ── Color-variant styles ─────────────────────────────────────────────────
  // These swap color based on active/dim variant.

  /// Gallery / artist brand title — 13 px · w400 · ls 2.5.
  TextStyle get brandTitle => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w400,
    letterSpacing: 2.5,
    color: _onColor,
  );

  /// Header navigation link — 12 px · w400 · ls 0.8.
  TextStyle get navLink => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.8,
    color: _onColor,
  );

  /// Mobile-drawer / sidebar list item — 13 px · w400 · ls 0.5.
  TextStyle get drawerItem => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: _onColor,
  );

  // ── Fixed-color styles ───────────────────────────────────────────────────
  // Color does not change with active/dim variant; always access from
  // `context.textOnDark.*` by convention.

  /// Brand subtitle — 11 px · w300 · ls 0.5 · [AppColors.onDarkMuted].
  TextStyle get brandSubtitle => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.5,
    color: AppColors.onDarkMuted,
  );

  /// Contacts CTA button label — 11 px · w400 · ls 1.5 · [AppColors.onDark].
  TextStyle get ctaLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: AppColors.onDark,
  );

  /// Footer brand title — 12 px · w400 · ls 2.0 · [AppColors.onDark].
  TextStyle get footerBrand => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w400,
    letterSpacing: 2.0,
    color: AppColors.onDark,
  );

  /// Footer "SITEMAP" section header — 10 px · w500 · ls 2.5 · [AppColors.onDarkFaint].
  TextStyle get footerSitemapLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize4XS,
    fontWeight: FontWeight.w500,
    letterSpacing: 2.5,
    color: AppColors.onDarkFaint,
  );

  /// Footer sitemap link — 13 px · w300 · [AppColors.onDarkBody].
  TextStyle get footerLink => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w300,
    color: AppColors.onDarkBody,
  );

  /// Footer copyright notice — 11 px · w300 · [AppColors.onDarkFaint].
  TextStyle get footerCopyright => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w300,
    color: AppColors.onDarkFaint,
  );

  /// Logo mark — proportional size · w300 · ls 1.5 · [AppColors.onDark].
  ///
  /// Pass the container [size] to derive the font size (`size × 0.28`).
  TextStyle logoMark(double size) => GoogleFonts.roboto(
    fontSize: size * 0.28,
    fontWeight: FontWeight.w300,
    letterSpacing: 1.5,
    color: AppColors.onDark,
  );
}
