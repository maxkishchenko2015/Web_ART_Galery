import 'package:flutter/material.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class AppTheme {
  const AppTheme._();

  static const Color _white = Color(0xFFFFFFFF);
  static const Color _black = Color(0xFF121212);
  static const Color _muted = Color(0xFF6F6F6F);
  static const Color _line = Color(0xFFE4E4E4);
  static const Color _panel = Color(0xFFF7F7F7);
  static const Color _selection = Color(0xFFCACDEC);

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    final colorScheme = const ColorScheme.light(
      brightness: Brightness.light,
      primary: _black,
      onPrimary: _white,
      secondary: _black,
      onSecondary: _white,
      error: Color(0xFFB3261E),
      onError: _white,
      surface: _white,
      onSurface: _black,
      surfaceContainerHighest: _panel,
      outline: _line,
      outlineVariant: _line,
      onSurfaceVariant: _muted,
    );

    final textTheme = base.textTheme
        .copyWith(
          displaySmall: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.6,
            height: 1.15,
            color: _black,
          ),
          headlineSmall: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
            height: 1.2,
            color: _black,
          ),
          titleLarge: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.2,
            height: 1.2,
            color: _black,
          ),
          titleMedium: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.2,
            height: 1.25,
            color: _black,
          ),
          bodyLarge: const TextStyle(fontSize: 18, height: 1.5, color: _black),
          bodyMedium: const TextStyle(fontSize: 16, height: 1.55, color: _black),
          bodySmall: const TextStyle(fontSize: 15, height: 1.5, color: _muted),
          labelLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            color: _black,
          ),
        )
        .apply(fontFamily: 'Helvetica Neue');

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _white,
      canvasColor: _white,
      dividerColor: _line,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: _selection,
        selectionHandleColor: _black,
      ),
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: _white,
        foregroundColor: _black,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
          color: _black,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: _white,
        indicatorColor: _panel,
        elevation: 0,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected ? _black : _muted,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(color: selected ? _black : _muted, size: KSize.iconM);
        }),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: _line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: _line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(KSize.radiusOfRoundButton)),
          borderSide: BorderSide(color: _black),
        ),
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        textStyle: TextStyle(fontSize: 16, color: _black),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _black,
        circularTrackColor: _line,
      ),
    );
  }
}
