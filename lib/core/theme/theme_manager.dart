import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class ThemeManager {
  static ThemeData getLightTheme() => LightTheme.theme;
  static ThemeData getDarkTheme() => DarkTheme.theme;

  static ThemeData getThemeByMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return getLightTheme();
      case ThemeMode.dark:
        return getDarkTheme();
      case ThemeMode.system:
        // This will be handled by Flutter automatically
        return getLightTheme(); // Fallback
    }
  }
}
