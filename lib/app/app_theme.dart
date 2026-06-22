import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _darkBackground = Color(0xFF101316);
  static const _darkSurface = Color(0xFF191D22);
  static const _darkSurfaceHigh = Color(0xFF232930);
  static const _darkPrimary = Color(0xFF65DAD0);
  static const _darkSecondary = Color(0xFFFFC857);

  static const _lightBackground = Color(0xFFF6F8F9);
  static const _lightSurface = Color(0xFFFFFFFF);
  static const _lightSurfaceHigh = Color(0xFFE9EFF0);
  static const _lightPrimary = Color(0xFF006B62);
  static const _lightSecondary = Color(0xFF805600);

  static ThemeData get dark => _build(
        brightness: Brightness.dark,
        background: _darkBackground,
        surface: _darkSurface,
        surfaceHigh: _darkSurfaceHigh,
        primary: _darkPrimary,
        secondary: _darkSecondary,
        divider: const Color(0xFF30363D),
      );

  static ThemeData get light => _build(
        brightness: Brightness.light,
        background: _lightBackground,
        surface: _lightSurface,
        surfaceHigh: _lightSurfaceHigh,
        primary: _lightPrimary,
        secondary: _lightSecondary,
        divider: const Color(0xFFD6DEE0),
      );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    required Color surface,
    required Color surfaceHigh,
    required Color primary,
    required Color secondary,
    required Color divider,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
    ).copyWith(
      primary: primary,
      secondary: secondary,
      surface: surface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: colorScheme.primaryContainer,
        height: 68,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceHigh,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primary, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      dividerColor: divider,
    );
  }
}
