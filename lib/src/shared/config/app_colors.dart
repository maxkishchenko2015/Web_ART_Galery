import 'package:flutter/material.dart';

/// Named color tokens for the app design system.
///
/// Usage — prefer named tokens over raw [Colors] semitransparent shorthands:
/// ```dart
/// // instead of: color: Colors.white70
/// color: AppColors.onDarkBody
/// ```
abstract final class AppColors {
  // ── Brand foundation ─────────────────────────────────────────────────────

  /// Primary brand green.
  static const Color forestGreen = Color(0xFF475F45);

  /// Dark secondary shell surface.
  static const Color darkOlive = Color(0xFF414840);

  /// Base white surface.
  static const Color white = Color(0xFFFFFFFF);

  /// Warm light surface.
  static const Color cream = Color(0xFFF5F0E8);

  /// Strong content text on light surfaces.
  static const Color darkText = Color(0xFF2B2B2B);

  /// Light-theme outline and divider tone.
  static const Color line = Color(0xFFE0DBD4);

  /// Text selection fill.
  static const Color selection = Color(0xFFBFCEBE);

  /// Material error token.
  static const Color error = Color(0xFFB3261E);

  // ── On-dark surface (navigation header, mobile drawer, footer) ──────────

  /// Full white — active text, icons, borders.
  static const Color onDark = Color(0xFFFFFFFF); // Colors.white

  /// 70 % white — inactive nav links, footer sitemap text.
  static const Color onDarkBody = Color(0xB3FFFFFF); // Colors.white70

  /// 60 % white — subtitles, inactive icon tints.
  static const Color onDarkMuted = Color(0x99FFFFFF); // Colors.white60

  /// 54 % white — logo circle border.
  static const Color onDarkSubtle = Color(0x8AFFFFFF); // Colors.white54

  /// 38 % white — sitemap section labels, copyright.
  static const Color onDarkFaint = Color(0x61FFFFFF); // Colors.white38

  /// 24 % white — dividers, selected CTA button fill.
  static const Color onDarkDivider = Color(0x3DFFFFFF); // Colors.white24

  /// 12 % white — selected drawer item background.
  static const Color onDarkOverlay = Color(0x1FFFFFFF); // Colors.white12

  /// Elevated panel for floating menus over dark surfaces.
  static const Color onDarkPanel = Color(0xFF40563E);

  /// Active menu item fill inside a dark panel.
  static const Color onDarkPanelActive = Color(0x33FFFFFF);

  /// Border tone for floating dark panels.
  static const Color onDarkPanelBorder = Color(0x24FFFFFF);

  /// Shared overlay shadow for floating UI.
  static const Color overlayShadow = Color(0x44000000);

  /// Footer stripe overlay over dark surfaces.
  static const Color footerOverlay = Color(0x1F000000);

  /// Placeholder panel on dark artwork sections.
  static const Color onDarkPlaceholder = Color(0x1AFFFFFF);

  /// Placeholder icon tint on dark artwork sections.
  static const Color onDarkPlaceholderIcon = Color(0x3DFFFFFF);

  // ── Content surface (light pages) ────────────────────────────────────────────────

  /// Primary body text on light surfaces — #4A4A4A.
  static const Color contentBody = Color(0xFF4A4A4A);

  /// Secondary body text — #5A5A5A.
  static const Color contentBodyLight = Color(0xFF5A5A5A);

  /// Muted / meta text — #7A7E78.
  static const Color contentMuted = Color(0xFF7A7E78);

  /// Biography section background — #F8F6F2.
  static const Color bioBg = Color(0xFFF8F6F2);

  /// Pull-quote block background — #EDF3EF.
  static const Color quoteBg = Color(0xFFEDF3EF);

  /// Decorative highlight on archive gradients.
  static const Color newsGlowLight = Color(0x14FFFFFF);

  /// Decorative shade on archive gradients.
  static const Color newsGlowDark = Color(0x14000000);

  /// Host chip fill on archive artwork cards.
  static const Color newsChipFill = Color(0x29FFFFFF);

  /// Host chip border on archive artwork cards.
  static const Color newsChipBorder = Color(0x2EFFFFFF);

  /// Featured archive year label.
  static const Color newsYearFeatured = Color(0xE6FFFFFF);

  /// Secondary archive year label.
  static const Color newsYearDefault = Color(0xD1FFFFFF);

  // ── Films play button ───────────────────────────────────────────────────

  /// Brand red used by the circular play-button overlay on film thumbnails.
  static const Color playButtonRed = Color(0xFFE0203A);

  // ── Archive card gradient accents ───────────────────────────────────────
  //
  // Each archive entry pairs a primary + secondary color to drive a
  // diagonal gradient on its card thumbnail. Tokens are named by hue so the
  // local repo seed reads as a palette rather than raw hex.

  static const Color archiveAccentBluePrimary = Color(0xFF7C95C7);
  static const Color archiveAccentBlueSecondary = Color(0xFF394F87);

  static const Color archiveAccentTerracottaPrimary = Color(0xFFB55A4F);
  static const Color archiveAccentTerracottaSecondary = Color(0xFF7A4536);

  static const Color archiveAccentRustPrimary = Color(0xFFC97A52);
  static const Color archiveAccentRustSecondary = Color(0xFF6B8A63);

  static const Color archiveAccentCrimsonPrimary = Color(0xFFC04A4A);
  static const Color archiveAccentCrimsonSecondary = Color(0xFF5C2B2B);

  static const Color archiveAccentAmberPrimary = Color(0xFFD3A24C);
  static const Color archiveAccentAmberSecondary = Color(0xFF8E6831);

  static const Color archiveAccentSagePrimary = Color(0xFF8DAA78);
  static const Color archiveAccentSageSecondary = Color(0xFF355743);
}

@immutable
class AppDesignColors extends ThemeExtension<AppDesignColors> {
  const AppDesignColors({
    required this.forestGreen,
    required this.darkOlive,
    required this.white,
    required this.cream,
    required this.darkText,
    required this.line,
    required this.selection,
    required this.error,
    required this.onDark,
    required this.onDarkBody,
    required this.onDarkMuted,
    required this.onDarkSubtle,
    required this.onDarkFaint,
    required this.onDarkDivider,
    required this.onDarkOverlay,
    required this.onDarkPanel,
    required this.onDarkPanelActive,
    required this.onDarkPanelBorder,
    required this.overlayShadow,
    required this.footerOverlay,
    required this.onDarkPlaceholder,
    required this.onDarkPlaceholderIcon,
    required this.contentBody,
    required this.contentBodyLight,
    required this.contentMuted,
    required this.bioBg,
    required this.quoteBg,
    required this.newsGlowLight,
    required this.newsGlowDark,
    required this.newsChipFill,
    required this.newsChipBorder,
    required this.newsYearFeatured,
    required this.newsYearDefault,
  });

  static const AppDesignColors light = AppDesignColors(
    forestGreen: AppColors.forestGreen,
    darkOlive: AppColors.darkOlive,
    white: AppColors.white,
    cream: AppColors.cream,
    darkText: AppColors.darkText,
    line: AppColors.line,
    selection: AppColors.selection,
    error: AppColors.error,
    onDark: AppColors.onDark,
    onDarkBody: AppColors.onDarkBody,
    onDarkMuted: AppColors.onDarkMuted,
    onDarkSubtle: AppColors.onDarkSubtle,
    onDarkFaint: AppColors.onDarkFaint,
    onDarkDivider: AppColors.onDarkDivider,
    onDarkOverlay: AppColors.onDarkOverlay,
    onDarkPanel: AppColors.onDarkPanel,
    onDarkPanelActive: AppColors.onDarkPanelActive,
    onDarkPanelBorder: AppColors.onDarkPanelBorder,
    overlayShadow: AppColors.overlayShadow,
    footerOverlay: AppColors.footerOverlay,
    onDarkPlaceholder: AppColors.onDarkPlaceholder,
    onDarkPlaceholderIcon: AppColors.onDarkPlaceholderIcon,
    contentBody: AppColors.contentBody,
    contentBodyLight: AppColors.contentBodyLight,
    contentMuted: AppColors.contentMuted,
    bioBg: AppColors.bioBg,
    quoteBg: AppColors.quoteBg,
    newsGlowLight: AppColors.newsGlowLight,
    newsGlowDark: AppColors.newsGlowDark,
    newsChipFill: AppColors.newsChipFill,
    newsChipBorder: AppColors.newsChipBorder,
    newsYearFeatured: AppColors.newsYearFeatured,
    newsYearDefault: AppColors.newsYearDefault,
  );

  final Color forestGreen;
  final Color darkOlive;
  final Color white;
  final Color cream;
  final Color darkText;
  final Color line;
  final Color selection;
  final Color error;
  final Color onDark;
  final Color onDarkBody;
  final Color onDarkMuted;
  final Color onDarkSubtle;
  final Color onDarkFaint;
  final Color onDarkDivider;
  final Color onDarkOverlay;
  final Color onDarkPanel;
  final Color onDarkPanelActive;
  final Color onDarkPanelBorder;
  final Color overlayShadow;
  final Color footerOverlay;
  final Color onDarkPlaceholder;
  final Color onDarkPlaceholderIcon;
  final Color contentBody;
  final Color contentBodyLight;
  final Color contentMuted;
  final Color bioBg;
  final Color quoteBg;
  final Color newsGlowLight;
  final Color newsGlowDark;
  final Color newsChipFill;
  final Color newsChipBorder;
  final Color newsYearFeatured;
  final Color newsYearDefault;

  @override
  AppDesignColors copyWith({
    Color? forestGreen,
    Color? darkOlive,
    Color? white,
    Color? cream,
    Color? darkText,
    Color? line,
    Color? selection,
    Color? error,
    Color? onDark,
    Color? onDarkBody,
    Color? onDarkMuted,
    Color? onDarkSubtle,
    Color? onDarkFaint,
    Color? onDarkDivider,
    Color? onDarkOverlay,
    Color? onDarkPanel,
    Color? onDarkPanelActive,
    Color? onDarkPanelBorder,
    Color? overlayShadow,
    Color? footerOverlay,
    Color? onDarkPlaceholder,
    Color? onDarkPlaceholderIcon,
    Color? contentBody,
    Color? contentBodyLight,
    Color? contentMuted,
    Color? bioBg,
    Color? quoteBg,
    Color? newsGlowLight,
    Color? newsGlowDark,
    Color? newsChipFill,
    Color? newsChipBorder,
    Color? newsYearFeatured,
    Color? newsYearDefault,
  }) {
    return AppDesignColors(
      forestGreen: forestGreen ?? this.forestGreen,
      darkOlive: darkOlive ?? this.darkOlive,
      white: white ?? this.white,
      cream: cream ?? this.cream,
      darkText: darkText ?? this.darkText,
      line: line ?? this.line,
      selection: selection ?? this.selection,
      error: error ?? this.error,
      onDark: onDark ?? this.onDark,
      onDarkBody: onDarkBody ?? this.onDarkBody,
      onDarkMuted: onDarkMuted ?? this.onDarkMuted,
      onDarkSubtle: onDarkSubtle ?? this.onDarkSubtle,
      onDarkFaint: onDarkFaint ?? this.onDarkFaint,
      onDarkDivider: onDarkDivider ?? this.onDarkDivider,
      onDarkOverlay: onDarkOverlay ?? this.onDarkOverlay,
      onDarkPanel: onDarkPanel ?? this.onDarkPanel,
      onDarkPanelActive: onDarkPanelActive ?? this.onDarkPanelActive,
      onDarkPanelBorder: onDarkPanelBorder ?? this.onDarkPanelBorder,
      overlayShadow: overlayShadow ?? this.overlayShadow,
      footerOverlay: footerOverlay ?? this.footerOverlay,
      onDarkPlaceholder: onDarkPlaceholder ?? this.onDarkPlaceholder,
      onDarkPlaceholderIcon: onDarkPlaceholderIcon ?? this.onDarkPlaceholderIcon,
      contentBody: contentBody ?? this.contentBody,
      contentBodyLight: contentBodyLight ?? this.contentBodyLight,
      contentMuted: contentMuted ?? this.contentMuted,
      bioBg: bioBg ?? this.bioBg,
      quoteBg: quoteBg ?? this.quoteBg,
      newsGlowLight: newsGlowLight ?? this.newsGlowLight,
      newsGlowDark: newsGlowDark ?? this.newsGlowDark,
      newsChipFill: newsChipFill ?? this.newsChipFill,
      newsChipBorder: newsChipBorder ?? this.newsChipBorder,
      newsYearFeatured: newsYearFeatured ?? this.newsYearFeatured,
      newsYearDefault: newsYearDefault ?? this.newsYearDefault,
    );
  }

  @override
  AppDesignColors lerp(ThemeExtension<AppDesignColors>? other, double t) {
    if (other is! AppDesignColors) {
      return this;
    }

    return AppDesignColors(
      forestGreen: Color.lerp(forestGreen, other.forestGreen, t) ?? forestGreen,
      darkOlive: Color.lerp(darkOlive, other.darkOlive, t) ?? darkOlive,
      white: Color.lerp(white, other.white, t) ?? white,
      cream: Color.lerp(cream, other.cream, t) ?? cream,
      darkText: Color.lerp(darkText, other.darkText, t) ?? darkText,
      line: Color.lerp(line, other.line, t) ?? line,
      selection: Color.lerp(selection, other.selection, t) ?? selection,
      error: Color.lerp(error, other.error, t) ?? error,
      onDark: Color.lerp(onDark, other.onDark, t) ?? onDark,
      onDarkBody: Color.lerp(onDarkBody, other.onDarkBody, t) ?? onDarkBody,
      onDarkMuted: Color.lerp(onDarkMuted, other.onDarkMuted, t) ?? onDarkMuted,
      onDarkSubtle: Color.lerp(onDarkSubtle, other.onDarkSubtle, t) ?? onDarkSubtle,
      onDarkFaint: Color.lerp(onDarkFaint, other.onDarkFaint, t) ?? onDarkFaint,
      onDarkDivider: Color.lerp(onDarkDivider, other.onDarkDivider, t) ?? onDarkDivider,
      onDarkOverlay: Color.lerp(onDarkOverlay, other.onDarkOverlay, t) ?? onDarkOverlay,
      onDarkPanel: Color.lerp(onDarkPanel, other.onDarkPanel, t) ?? onDarkPanel,
      onDarkPanelActive:
          Color.lerp(onDarkPanelActive, other.onDarkPanelActive, t) ?? onDarkPanelActive,
      onDarkPanelBorder:
          Color.lerp(onDarkPanelBorder, other.onDarkPanelBorder, t) ?? onDarkPanelBorder,
      overlayShadow: Color.lerp(overlayShadow, other.overlayShadow, t) ?? overlayShadow,
      footerOverlay: Color.lerp(footerOverlay, other.footerOverlay, t) ?? footerOverlay,
      onDarkPlaceholder:
          Color.lerp(onDarkPlaceholder, other.onDarkPlaceholder, t) ?? onDarkPlaceholder,
      onDarkPlaceholderIcon:
          Color.lerp(onDarkPlaceholderIcon, other.onDarkPlaceholderIcon, t) ??
          onDarkPlaceholderIcon,
      contentBody: Color.lerp(contentBody, other.contentBody, t) ?? contentBody,
      contentBodyLight: Color.lerp(contentBodyLight, other.contentBodyLight, t) ?? contentBodyLight,
      contentMuted: Color.lerp(contentMuted, other.contentMuted, t) ?? contentMuted,
      bioBg: Color.lerp(bioBg, other.bioBg, t) ?? bioBg,
      quoteBg: Color.lerp(quoteBg, other.quoteBg, t) ?? quoteBg,
      newsGlowLight: Color.lerp(newsGlowLight, other.newsGlowLight, t) ?? newsGlowLight,
      newsGlowDark: Color.lerp(newsGlowDark, other.newsGlowDark, t) ?? newsGlowDark,
      newsChipFill: Color.lerp(newsChipFill, other.newsChipFill, t) ?? newsChipFill,
      newsChipBorder: Color.lerp(newsChipBorder, other.newsChipBorder, t) ?? newsChipBorder,
      newsYearFeatured: Color.lerp(newsYearFeatured, other.newsYearFeatured, t) ?? newsYearFeatured,
      newsYearDefault: Color.lerp(newsYearDefault, other.newsYearDefault, t) ?? newsYearDefault,
    );
  }
}
