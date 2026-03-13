import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class AppTheme {
  const AppTheme._();

  // Museum green palette
  static const Color forestGreen = Color(0xFF475F45);
  static const Color darkOlive = Color(0xFF414840);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _cream = Color(0xFFF5F0E8);
  static const Color _darkText = Color(0xFF2B2B2B);
  static const Color _muted = Color(0xFF7A7E78);
  static const Color _line = Color(0xFFE0DBD4);
  static const Color _panel = Color(0xFFF8F6F2);
  static const Color _selection = Color(0xFFBFCEBE);

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    final colorScheme = const ColorScheme.light(
      brightness: Brightness.light,
      primary: forestGreen,
      onPrimary: _white,
      secondary: darkOlive,
      onSecondary: _white,
      error: Color(0xFFB3261E),
      onError: _white,
      surface: _white,
      onSurface: _darkText,
      surfaceContainerHighest: _panel,
      surfaceContainerLow: _cream,
      outline: _line,
      outlineVariant: _line,
      onSurfaceVariant: _muted,
    );

    final baseTextTheme = GoogleFonts.robotoTextTheme(base.textTheme);
    final textTheme = baseTextTheme.copyWith(
      displayLarge: GoogleFonts.roboto(
        fontSize: 57,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        height: 1.12,
        color: _darkText,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 45,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.3,
        height: 1.16,
        color: _darkText,
      ),
      displaySmall: GoogleFonts.roboto(
        fontSize: 36,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.2,
        height: 1.2,
        color: _darkText,
      ),
      headlineLarge: GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.1,
        height: 1.25,
        color: _darkText,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.w300,
        height: 1.3,
        color: _darkText,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.33,
        color: _darkText,
      ),
      titleLarge: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 1.27,
        color: _darkText,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        height: 1.33,
        color: _darkText,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: _darkText,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        height: 1.55,
        color: _darkText,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        height: 1.6,
        color: _darkText,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: _muted,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: _darkText,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
        color: _muted,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: _muted,
      ),
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _white,
      canvasColor: _white,
      dividerColor: _line,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: _selection,
        selectionHandleColor: forestGreen,
      ),
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: forestGreen,
        foregroundColor: _white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 2,
          color: _white,
        ),
        iconTheme: const IconThemeData(color: _white),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: forestGreen,
        indicatorColor: Colors.white24,
        elevation: 0,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return GoogleFonts.roboto(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: selected ? _white : Colors.white60,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(color: selected ? _white : Colors.white60, size: KSize.iconM);
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: forestGreen,
          foregroundColor: _white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin8x, vertical: KSize.margin4x),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: forestGreen,
          side: const BorderSide(color: forestGreen),
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin8x, vertical: KSize.margin4x),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: forestGreen),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: _line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: _line),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: forestGreen),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: GoogleFonts.roboto(fontSize: 15, color: _darkText),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: forestGreen,
        circularTrackColor: _line,
      ),
      cardTheme: CardThemeData(
        color: _white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(KSize.radiusDefault)),
        ),
      ),
      dividerTheme: const DividerThemeData(color: _line, space: 1, thickness: 1),
    );
  }
}
