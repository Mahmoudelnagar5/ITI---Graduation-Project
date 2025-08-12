import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utilities/app_colors.dart';
import '../utilities/font_manager.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.mainColorStart,
    scaffoldBackgroundColor: AppColors.lightScaffoldBg,
    colorScheme: const ColorScheme.light(
      primary: AppColors.mainColorStart,
      secondary: AppColors.adminPrimaryColor,
      surface: AppColors.lightScaffoldBg,
      background: AppColors.lightScaffoldBg,
      error: AppColors.adminPrimaryColor,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.lightHomeUserTitle,
      onBackground: AppColors.lightHomeUserTitle,
      onError: AppColors.white,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackAppBar,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 18.sp,
        fontWeight: AppFontWeight.semiBold,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.lightCardBg,
      elevation: 2,
      shadowColor: AppColors.lightShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.lightCardBorder, width: 1),
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColorStart,
        foregroundColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.mainColorStart.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.medium),
      ),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.mainColorStart,
        side: const BorderSide(color: AppColors.mainColorStart, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.medium),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.mainColorStart,
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.medium),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightCardBg,
      hintStyle: TextStyle(
        color: AppColors.lightHintTextField,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.regular,
      ),
      labelStyle: TextStyle(
        color: AppColors.lightTitleTextField,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.medium,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.lightUnfocusedTextFieldBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.lightUnfocusedTextFieldBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.mainColorStart, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.adminPrimaryColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.adminPrimaryColor,
          width: 2,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 32.sp,
        fontWeight: AppFontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 28.sp,
        fontWeight: AppFontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 24.sp,
        fontWeight: AppFontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 22.sp,
        fontWeight: AppFontWeight.semiBold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 20.sp,
        fontWeight: AppFontWeight.semiBold,
      ),
      headlineSmall: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 18.sp,
        fontWeight: AppFontWeight.semiBold,
      ),
      titleLarge: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 16.sp,
        fontWeight: AppFontWeight.medium,
      ),
      titleMedium: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.medium,
      ),
      titleSmall: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.medium,
      ),
      bodyLarge: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 16.sp,
        fontWeight: AppFontWeight.regular,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightHomeUserSubtitle,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.regular,
      ),
      bodySmall: TextStyle(
        color: AppColors.lightHomeUserSubtitle,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.regular,
      ),
      labelLarge: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.medium,
      ),
      labelMedium: TextStyle(
        color: AppColors.lightHomeUserSubtitle,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.medium,
      ),
      labelSmall: TextStyle(
        color: AppColors.lightHomeUserSubtitle,
        fontSize: 10.sp,
        fontWeight: AppFontWeight.medium,
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: AppColors.lightSemiBrown, size: 24),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.mainColorStart,
      unselectedItemColor: AppColors.lightSemiBrown,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColorStart,
      foregroundColor: AppColors.white,
      elevation: 4,
    ),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.lightDividerColor,
      thickness: 1,
      space: 1,
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightSearchFillColor,
      selectedColor: AppColors.mainColorStart,
      disabledColor: AppColors.lightGrey,
      labelStyle: TextStyle(
        color: AppColors.lightHomeUserTitle,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.medium,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.mainColorStart,
      linearTrackColor: AppColors.lightUnfocusedTextFieldBorder,
    ),

    // Switch Theme
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.white;
        }
        return AppColors.lightGrey;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.mainColorStart;
        }
        return AppColors.lightUnfocusedTextFieldBorder;
      }),
    ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.mainColorStart;
        }
        return AppColors.white;
      }),
      checkColor: MaterialStateProperty.all(AppColors.white),
      side: const BorderSide(
        color: AppColors.lightUnfocusedTextFieldBorder,
        width: 2,
      ),
    ),

    // Radio Theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.mainColorStart;
        }
        return AppColors.lightUnfocusedTextFieldBorder;
      }),
    ),
  );
}
