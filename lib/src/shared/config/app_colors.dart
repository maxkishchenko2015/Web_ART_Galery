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
}
