import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/app_theme.dart';
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

  // ── Hero section (dark surface) ────────────────────────────────────────────────

  /// Hero section page label — 11 px · w400 · ls 3 · [AppColors.onDarkSubtle].
  TextStyle get heroSectionLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w400,
    letterSpacing: 3,
    color: AppColors.onDarkSubtle,
  );

  /// Hero large headline — dynamic [fontSize] · w300 · h 1.15 · [AppColors.onDark].
  TextStyle heroHeadline(double fontSize) => GoogleFonts.roboto(
    fontSize: fontSize,
    fontWeight: FontWeight.w300,
    height: 1.15,
    color: AppColors.onDark,
  );

  /// Hero subtitle heading — 16 px · w400 · ls 1.5 · [AppColors.onDarkBody].
  TextStyle get heroSubtitle => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: AppColors.onDarkBody,
  );

  /// Hero description body — 15 px · w300 · h 1.7 · [AppColors.onDarkMuted].
  TextStyle get heroBody => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w300,
    height: 1.7,
    color: AppColors.onDarkMuted,
  );

  /// Hero button label — 12 px · w500 · ls 1.5.
  /// [filled] switches between [AppTheme.forestGreen] and [AppColors.onDark].
  TextStyle heroButtonLabel(bool filled) => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: filled ? AppTheme.forestGreen : AppColors.onDark,
  );

  /// Language switcher caption — 13 px · w300 · [AppColors.onDarkMuted].
  TextStyle get languageLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w300,
    color: AppColors.onDarkMuted,
  );

  /// Language switcher selected value — 14 px · w700 · [AppColors.onDark].
  TextStyle get languageValue => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w700,
    color: AppColors.onDark,
  );

  /// Floating language menu item label.
  TextStyle languageMenuItem(bool selected) => GoogleFonts.roboto(
    fontSize: KSize.fontSizeM,
    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
    color: selected ? AppColors.onDark : AppColors.onDarkBody,
  );
}

// ────────────────────────────────────────────────────────────────────────────────

/// Named text styles for light (content) surfaces: feature sections,
/// biography, stats, etc.
///
/// Access via [BuildContext]:
/// ```dart
/// style: context.textContent.featureHeadline
/// style: context.textContent.bioName(isCompact ? 24.0 : 34.0)
/// ```
@immutable
class ContentTextTheme {
  const ContentTextTheme();

  // ── Feature section ────────────────────────────────────────────────────────────

  /// Feature section heading — 34 px · w300 · h 1.2 · [AppTheme.darkOlive].
  TextStyle get featureHeadline => GoogleFonts.roboto(
    fontSize: 34,
    fontWeight: FontWeight.w300,
    height: 1.2,
    color: AppTheme.darkOlive,
  );

  /// Feature body text — 16 px · w300 · h 1.75 · [AppColors.contentBodyLight].
  TextStyle get featureBody => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w300,
    height: 1.75,
    color: AppColors.contentBodyLight,
  );

  /// Feature CTA link — 11 px · w500 · ls 2 · [AppTheme.forestGreen].
  TextStyle get featureCta => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w500,
    letterSpacing: 2,
    color: AppTheme.forestGreen,
  );

  // ── Stats ────────────────────────────────────────────────────────────────────

  /// Stat large value — 36 px · w300 · [AppTheme.forestGreen].
  TextStyle get statValue => GoogleFonts.roboto(
    fontSize: KSize.br6fontSize4XLHalf,
    fontWeight: FontWeight.w300,
    color: AppTheme.forestGreen,
  );

  /// Stat description label — 14 px · w400 · [AppColors.contentMuted].
  TextStyle get statLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w400,
    color: AppColors.contentMuted,
  );

  // ── Biography ────────────────────────────────────────────────────────────────

  /// Author name heading — responsive [fontSize] · w400 · h 1.2 · [AppTheme.darkOlive].
  TextStyle bioName(double fontSize) => GoogleFonts.roboto(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: AppTheme.darkOlive,
  );

  /// Bio tagline — 14 px · w400 · ls 0.3 · [AppTheme.forestGreen].
  TextStyle get bioTagline => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    color: AppTheme.forestGreen,
  );

  /// Bio intro paragraph — 16 px · w300 · h 1.75 · [AppColors.contentBody].
  TextStyle get bioIntro => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w300,
    height: 1.75,
    color: AppColors.contentBody,
  );

  /// Bio sub-section title — 18 px · w500 · h 1.3 · [AppTheme.darkOlive].
  TextStyle get bioSectionTitle => GoogleFonts.roboto(
    fontSize: KSize.fontSizeM,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: AppTheme.darkOlive,
  );

  /// Bio sub-section body — 15 px · w300 · h 1.8 · [AppColors.contentBody].
  TextStyle get bioBody => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w300,
    height: 1.8,
    color: AppColors.contentBody,
  );

  /// Bio detail / supplementary text — 14 px · w300 · h 1.75 · [AppColors.contentBody].
  TextStyle get bioDetail => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w300,
    height: 1.75,
    color: AppColors.contentBody,
  );

  /// Bio highlight row label (bold part) — 14 px · w500 · [AppTheme.darkOlive].
  TextStyle get bioHighlightLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w500,
    color: AppTheme.darkOlive,
  );

  /// Bio highlight row body text — 14 px · w300 · h 1.7 · [AppColors.contentBody].
  TextStyle get bioHighlightText => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w300,
    height: 1.7,
    color: AppColors.contentBody,
  );

  /// Pull-quote text — 16 px · w300 · italic · h 1.75 · [AppTheme.darkOlive].
  TextStyle get bioQuote => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    height: 1.75,
    color: AppTheme.darkOlive,
  );

  /// Quote attribution — 13 px · w400 · ls 0.5 · [AppTheme.forestGreen].
  TextStyle get bioQuoteAuthor => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: AppTheme.forestGreen,
  );
}
