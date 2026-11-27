import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/app_palette.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class AppTheme {
  const AppTheme._();

  /// Default (parchment) theme.
  static ThemeData get light => forPalette(AppPalette.parchment);

  /// Theme built from [palette]'s design tokens; the tokens are also attached
  /// as the [AppDesignColors] extension that widgets read via `context.colors`.
  static ThemeData forPalette(AppPalette palette) {
    final isDark = palette.brightness == Brightness.dark;
    final base = isDark ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true);
    final colors = palette.colors;
    final colorScheme = ColorScheme(
      brightness: palette.brightness,
      primary: colors.forestGreen,
      onPrimary: colors.onAccent,
      secondary: colors.terracotta,
      onSecondary: colors.onAccent,
      error: colors.error,
      onError: colors.white,
      surface: colors.parchmentCard,
      onSurface: colors.darkText,
      surfaceContainerHighest: colors.bioBg,
      surfaceContainerLow: colors.cream,
      outline: colors.parchmentLine,
      outlineVariant: colors.parchmentLine,
      onSurfaceVariant: colors.contentMuted,
    );

    final baseTextTheme = GoogleFonts.robotoTextTheme(base.textTheme);
    final textTheme = baseTextTheme.copyWith(
      displayLarge: GoogleFonts.ptSerif(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.5,
        height: 1.12,
        color: colors.darkText,
      ),
      displayMedium: GoogleFonts.ptSerif(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.3,
        height: 1.16,
        color: colors.darkText,
      ),
      displaySmall: GoogleFonts.ptSerif(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.2,
        height: 1.2,
        color: colors.darkText,
      ),
      headlineLarge: GoogleFonts.ptSerif(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.1,
        height: 1.25,
        color: colors.darkText,
      ),
      headlineMedium: GoogleFonts.ptSerif(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: colors.darkText,
      ),
      headlineSmall: GoogleFonts.ptSerif(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.33,
        color: colors.darkText,
      ),
      titleLarge: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 1.27,
        color: colors.darkText,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        height: 1.33,
        color: colors.darkText,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: colors.darkText,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        height: 1.55,
        color: colors.darkText,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        height: 1.6,
        color: colors.darkText,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: colors.contentMuted,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: colors.darkText,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
        color: colors.contentMuted,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: colors.contentMuted,
      ),
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.parchment,
      canvasColor: colors.parchment,
      dividerColor: colors.line,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      extensions: <ThemeExtension<dynamic>>[colors],
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: colors.selection,
        selectionHandleColor: colors.forestGreen,
      ),
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.shell,
        foregroundColor: colors.onDark,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 2,
          color: colors.white,
        ),
        iconTheme: IconThemeData(color: colors.white),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.shell,
        indicatorColor: colors.onDarkDivider,
        elevation: 0,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return GoogleFonts.roboto(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: selected ? colors.white : colors.onDarkMuted,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? colors.white : colors.onDarkMuted,
            size: KSize.iconM,
          );
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.terracotta,
          foregroundColor: colors.onAccent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin8x, vertical: KSize.margin4x),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.forestGreen,
          side: BorderSide(color: colors.forestGreen),
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin8x, vertical: KSize.margin4x),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: colors.forestGreen),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: colors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: colors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: colors.forestGreen),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: GoogleFonts.roboto(fontSize: 15, color: colors.darkText),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.forestGreen,
        circularTrackColor: colors.line,
      ),
      cardTheme: CardThemeData(
        color: colors.parchmentCard,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(KSize.radiusDefault)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.line,
        space: KSize.borderWidthVerySmall,
        thickness: KSize.borderWidthVerySmall,
      ),
    );
  }
}
