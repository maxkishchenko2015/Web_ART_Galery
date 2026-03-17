import 'package:flutter/material.dart';

/// Named color tokens for the app design system.
///
/// Usage — prefer named tokens over raw [Colors] semitransparent shorthands:
/// ```dart
/// // instead of: color: Colors.white70
/// color: AppColors.onDarkBody
/// ```
abstract final class AppColors {
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
}
