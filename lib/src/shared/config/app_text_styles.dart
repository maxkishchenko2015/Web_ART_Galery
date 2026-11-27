import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Named text styles for the navigation shell and other dark surfaces
/// (header, drawer, footer, home hero, terracotta band).
///
/// Headings use PT Serif (full Cyrillic coverage), UI text uses Roboto.
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
  ShellTextTheme.active(this._colors) : _onColor = _colors.onDark;
  ShellTextTheme.dim(this._colors) : _onColor = _colors.onDarkBody;

  final AppDesignColors _colors;
  final Color _onColor;

  // ── Color-variant styles ─────────────────────────────────────────────────
  // These swap color based on active/dim variant.

  /// Gallery / artist brand title — PT Serif 18 px · ls 1.4.
  TextStyle get brandTitle => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeM,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.4,
    height: 1.2,
    color: _onColor,
  );

  /// Header navigation link — 14 px · w400 · ls 0.3.
  TextStyle get navLink => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    color: _onColor,
  );

  /// Mobile-drawer / sidebar list item — 16 px · w400 · ls 0.3.
  TextStyle get drawerItem => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    color: _onColor,
  );

  // ── Fixed-color styles ───────────────────────────────────────────────────
  // Color does not change with active/dim variant; always access from
  // `context.textOnDark.*` by convention.

  /// Brand subtitle — 12 px · w300 · ls 0.3 · [AppColors.onDarkMuted].
  TextStyle get brandSubtitle => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.3,
    color: _colors.onDarkMuted,
  );

  /// Contacts CTA button label — 12 px · w600 · ls 1.6 · [AppColors.onDark].
  TextStyle get ctaLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.6,
    color: _colors.onDark,
  );

  /// Footer brand title — PT Serif 18 px · ls 1.4 · [AppColors.onDark].
  TextStyle get footerBrand => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeM,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.4,
    color: _colors.onDark,
  );

  /// Footer column heading — 14 px · w500 · [AppColors.onDark].
  TextStyle get footerHeading => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
    color: _colors.onDark,
  );

  /// Footer "SITEMAP" section header — 10 px · w500 · ls 2.5 · [AppColors.onDarkFaint].
  TextStyle get footerSitemapLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize4XS,
    fontWeight: FontWeight.w500,
    letterSpacing: 2.5,
    color: _colors.onDarkFaint,
  );

  /// Footer sitemap link — 13 px · w300 · [AppColors.onDarkBody].
  TextStyle get footerLink => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w300,
    height: 1.5,
    color: _colors.onDarkBody,
  );

  /// Footer copyright notice — 12 px · w300 · [AppColors.onDarkMuted].
  TextStyle get footerCopyright => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w300,
    color: _colors.onDarkMuted,
  );

  /// Logo mark — proportional PT Serif · ls 1.2 · [AppColors.onDark].
  ///
  /// Pass the container [size] to derive the font size (`size × 0.3`).
  TextStyle logoMark(double size) => GoogleFonts.ptSerif(
    fontSize: size * 0.3,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.2,
    color: _colors.onDark,
  );

  // ── Hero section (dark surface) ────────────────────────────────────────────────

  /// Hero section page label — 11 px · w400 · ls 3 · [AppColors.onDarkSubtle].
  TextStyle get heroSectionLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w400,
    letterSpacing: 3,
    color: _colors.onDarkSubtle,
  );

  /// Eyebrow over the home hero headline — 13 px · w600 · ls 4 ·
  /// [AppColors.terracottaLight].
  TextStyle get heroEyebrow => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w600,
    letterSpacing: 4,
    color: _colors.terracottaLight,
  );

  /// Hero large headline — PT Serif · dynamic [fontSize] · h 1.08 · [AppColors.onDark].
  TextStyle heroHeadline(double fontSize) => GoogleFonts.ptSerif(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    height: 1.08,
    color: _colors.onDark,
  );

  /// Italic hero lead paragraph — PT Serif italic · dynamic [fontSize] ·
  /// [AppColors.onDarkBody].
  TextStyle heroLead(double fontSize) => GoogleFonts.ptSerif(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.55,
    color: _colors.onDarkBody,
  );

  /// Hero subtitle heading — 16 px · w400 · ls 1.5 · [AppColors.onDarkBody].
  TextStyle get heroSubtitle => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: _colors.onDarkBody,
  );

  /// Hero description body — 15 px · w300 · h 1.7 · [AppColors.onDarkMuted].
  TextStyle get heroBody => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w300,
    height: 1.7,
    color: _colors.onDarkMuted,
  );

  /// Pill button label — 13 px · w600 · ls 1.6. [onAccent] for filled
  /// (accent) buttons, otherwise the shell's on-color.
  TextStyle pillButtonLabel({required bool onAccent}) => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.6,
    color: onAccent ? _colors.onAccent : _colors.onDark,
  );

  /// Hero button label — 12 px · w500 · ls 1.5.
  /// [filled] switches between the primary brand color and full on-dark white.
  TextStyle heroButtonLabel(bool filled) => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: filled ? _colors.forestGreen : _colors.onDark,
  );

  /// Accent band title — PT Serif · dynamic [fontSize] · [AppColors.onAccent].
  TextStyle bandTitle(double fontSize) => GoogleFonts.ptSerif(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    height: 1.15,
    color: _colors.onAccent,
  );

  /// Accent band body — 14 px · w300 · h 1.55 · [AppColors.onAccent] 80 %.
  TextStyle get bandBody => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w300,
    height: 1.55,
    color: _colors.onAccent.withValues(alpha: 0.8),
  );

  /// "Full catalog" tile label — 15 px · w400 · h 1.35 · [AppColors.onAccent].
  TextStyle get tileLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w400,
    height: 1.35,
    color: _colors.onAccent,
  );

  /// Caption laid over a photo gradient — PT Serif 16 px · [AppColors.onDark].
  TextStyle get photoCaption => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w400,
    height: 1.25,
    color: _colors.onDark,
  );

  /// Language switcher caption — 13 px · w300 · [AppColors.onDarkMuted].
  TextStyle get languageLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w300,
    color: _colors.onDarkMuted,
  );

  /// Language switcher selected value — 14 px · w600 · [AppColors.onDark].
  TextStyle get languageValue => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w600,
    color: _colors.onDark,
  );

  /// Floating language menu item label.
  TextStyle languageMenuItem(bool selected) => GoogleFonts.roboto(
    fontSize: KSize.fontSizeM,
    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
    color: selected ? _colors.onDark : _colors.onDarkBody,
  );
}

// ────────────────────────────────────────────────────────────────────────────────

/// Named text styles for light (parchment) content surfaces: home cards,
/// feature sections, biography, stats, etc.
///
/// Access via [BuildContext]:
/// ```dart
/// style: context.textContent.featureHeadline
/// style: context.textContent.bioName(isCompact ? 24.0 : 34.0)
/// ```
@immutable
class ContentTextTheme {
  const ContentTextTheme(this._colors);

  final AppDesignColors _colors;

  // ── Home page ──────────────────────────────────────────────────────────────────

  /// Section eyebrow ("О ХУДОЖНИКЕ") — 12 px · w600 · ls 2.8 · [AppColors.terracotta].
  TextStyle get eyebrow => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.8,
    color: _colors.terracotta,
  );

  /// Home section / card title — PT Serif · dynamic [fontSize] · h 1.15.
  TextStyle homeTitle(double fontSize) => GoogleFonts.ptSerif(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    height: 1.15,
    color: _colors.darkText,
  );

  /// Home card body — 15 px · w400 · h 1.6 · [AppColors.contentBody].
  TextStyle get homeBody => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: _colors.contentBody,
  );

  /// Home body on phones — 14 px · w400 · h 1.5 · [AppColors.contentBody].
  TextStyle get homeBodyCompact => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: _colors.contentBody,
  );

  /// Underlined arrow link ("ПОДРОБНЕЕ ОБ АВТОРЕ →") — 12 px · w700 · ls 1.6 ·
  /// [AppColors.terracotta].
  TextStyle get homeLink => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.6,
    color: _colors.terracotta,
  );

  /// Small meta text (dates) — 13 px · w400 · [AppColors.contentMuted].
  TextStyle get homeMeta => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w400,
    color: _colors.contentMuted,
  );

  /// Quick-link title — PT Serif 18 px · w700 · [AppColors.darkText].
  TextStyle get quickLinkTitle => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeM,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: _colors.darkText,
  );

  /// Quick-link label under the icon on phones — 13 px · w500 · [AppColors.darkText].
  TextStyle get quickLinkLabelCompact => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w500,
    height: 1.25,
    color: _colors.darkText,
  );

  /// Quick-link / start-route subtitle — 13 px · w400 · h 1.4 · [AppColors.contentMuted].
  TextStyle get quickLinkSubtitle => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: _colors.contentMuted,
  );

  /// Tag chip label ("Источник: YOUTUBE") — 12 px · w600 · ls 0.8 · [AppColors.contentBody].
  TextStyle get chipLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
    color: _colors.contentBody,
  );

  /// Filter chip label — 14 px · w500 (color set by the chip).
  TextStyle get filterChipLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    color: _colors.darkText,
  );

  /// Field / filter caption ("Период:") — PT Serif 16 px · [AppColors.darkText].
  TextStyle get fieldCaption => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w400,
    color: _colors.darkText,
  );

  /// Italic date on cards — 13 px · italic · [AppColors.contentMuted].
  TextStyle get cardDate => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: _colors.contentMuted,
  );

  /// Year group heading on the archive ("2026 ГОД") — 13 px · w700 · ls 2.4 ·
  /// [AppColors.terracotta].
  TextStyle get yearHeading => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.4,
    color: _colors.terracotta,
  );

  /// Contact value (phone, handle) — 18 px · w400 · [AppColors.darkText].
  TextStyle get contactValue => GoogleFonts.roboto(
    fontSize: KSize.fontSizeM,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    color: _colors.darkText,
  );

  /// Search field input — 15 px · w400 · [AppColors.darkText].
  TextStyle get inputText => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w400,
    color: _colors.darkText,
  );

  /// Search field hint — 15 px · w300 · [AppColors.contentMuted].
  TextStyle get inputHint => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w300,
    color: _colors.contentMuted,
  );

  /// Start-route title — 15 px · w700 · h 1.3 · [AppColors.darkText].
  TextStyle get startRouteTitle => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: _colors.darkText,
  );

  // ── Feature section ────────────────────────────────────────────────────────────

  /// Feature section heading — PT Serif 34 px · h 1.2 · [AppColors.darkOlive].
  TextStyle get featureHeadline => GoogleFonts.ptSerif(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: _colors.darkOlive,
  );

  /// Feature body text — 16 px · w300 · h 1.75 · [AppColors.contentBodyLight].
  TextStyle get featureBody => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w300,
    height: 1.75,
    color: _colors.contentBodyLight,
  );

  /// Feature CTA link — 12 px · w700 · ls 1.6 · [AppColors.terracotta].
  TextStyle get featureCta => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XS,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.6,
    color: _colors.terracotta,
  );

  /// Archive/news section heading — PT Serif 40 px · h 1.08 · [AppColors.darkOlive].
  TextStyle get archiveSectionTitle => GoogleFonts.ptSerif(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    height: 1.08,
    color: _colors.darkOlive,
  );

  /// Archive section micro-label — 11 px · w600 · ls 2.2 · [AppColors.terracotta].
  TextStyle get archiveSectionLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.2,
    color: _colors.terracotta,
  );

  /// Featured archive card title — PT Serif 22 px · h 1.22 · [AppColors.darkOlive].
  TextStyle get archiveFeaturedTitle => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeXL,
    fontWeight: FontWeight.w400,
    height: 1.22,
    color: _colors.darkOlive,
  );

  /// Secondary archive card title — PT Serif 18 px · h 1.28 · [AppColors.darkOlive].
  TextStyle get archiveCardTitle => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeM,
    fontWeight: FontWeight.w400,
    height: 1.28,
    color: _colors.darkOlive,
  );

  /// Archive excerpt text — 15 px · w300 · h 1.65 · [AppColors.contentBody].
  TextStyle get archiveExcerpt => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w300,
    height: 1.65,
    color: _colors.contentBody,
  );

  /// Archive date text — 13 px · italic · [AppColors.contentMuted].
  TextStyle get archiveDate => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: _colors.contentMuted,
  );

  /// Archive source chip / metadata — 11 px · w600 · ls 1.6 · [AppColors.terracotta].
  TextStyle get archiveMeta => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.6,
    color: _colors.terracotta,
  );

  /// Archive external link CTA — 11 px · w700 · ls 1.8 · [AppColors.terracotta].
  TextStyle get archiveLink => GoogleFonts.roboto(
    fontSize: KSize.fontSize3XS,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.8,
    color: _colors.terracotta,
  );

  // ── Stats ────────────────────────────────────────────────────────────────────

  /// Stat large value — PT Serif 36 px · w700 · [AppColors.terracotta].
  TextStyle get statValue => GoogleFonts.ptSerif(
    fontSize: KSize.br6fontSize4XLHalf,
    fontWeight: FontWeight.w700,
    color: _colors.terracotta,
  );

  /// Stat description label — 16 px · w600 · [AppColors.darkText].
  TextStyle get statLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: _colors.darkText,
  );

  // ── Biography ────────────────────────────────────────────────────────────────

  /// Author name heading — PT Serif · responsive [fontSize] · h 1.2 · [AppColors.darkOlive].
  TextStyle bioName(double fontSize) => GoogleFonts.ptSerif(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: _colors.darkOlive,
  );

  /// Bio tagline — 14 px · w500 · ls 0.3 · [AppColors.terracotta].
  TextStyle get bioTagline => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
    color: _colors.terracotta,
  );

  /// Bio intro paragraph — 16 px · w300 · h 1.75 · [AppColors.contentBody].
  TextStyle get bioIntro => GoogleFonts.roboto(
    fontSize: KSize.fontSizeS,
    fontWeight: FontWeight.w300,
    height: 1.75,
    color: _colors.contentBody,
  );

  /// Bio sub-section title — PT Serif 22 px · h 1.25 · [AppColors.darkOlive].
  TextStyle get bioSectionTitle => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeXL,
    fontWeight: FontWeight.w400,
    height: 1.25,
    color: _colors.darkOlive,
  );

  /// Bio sub-section body — 15 px · w300 · h 1.8 · [AppColors.contentBody].
  TextStyle get bioBody => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXSHalf,
    fontWeight: FontWeight.w300,
    height: 1.8,
    color: _colors.contentBody,
  );

  /// Bio detail / supplementary text — 14 px · w300 · h 1.75 · [AppColors.contentBody].
  TextStyle get bioDetail => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w300,
    height: 1.75,
    color: _colors.contentBody,
  );

  /// Bio highlight row label (bold part) — 14 px · w500 · [AppColors.darkOlive].
  TextStyle get bioHighlightLabel => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w500,
    color: _colors.darkOlive,
  );

  /// Bio highlight row body text — 14 px · w300 · h 1.7 · [AppColors.contentBody].
  TextStyle get bioHighlightText => GoogleFonts.roboto(
    fontSize: KSize.fontSizeXS,
    fontWeight: FontWeight.w300,
    height: 1.7,
    color: _colors.contentBody,
  );

  /// Pull-quote text — PT Serif italic 18 px · h 1.7 · [AppColors.darkOlive].
  TextStyle get bioQuote => GoogleFonts.ptSerif(
    fontSize: KSize.fontSizeM,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.7,
    color: _colors.darkOlive,
  );

  /// Quote attribution — 13 px · w500 · ls 0.5 · [AppColors.terracotta].
  TextStyle get bioQuoteAuthor => GoogleFonts.roboto(
    fontSize: KSize.fontSize2XSHalf,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: _colors.terracotta,
  );
}
