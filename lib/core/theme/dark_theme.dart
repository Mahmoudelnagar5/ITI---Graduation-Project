import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utilities/app_colors.dart';
import '../utilities/font_manager.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.mainColorStart,
    scaffoldBackgroundColor: AppColors.darkScaffoldBg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.mainColorStart,
      secondary: AppColors.adminPrimaryColor,
      surface: AppColors.darkScaffoldBg,
      background: AppColors.darkScaffoldBg,
      error: AppColors.adminPrimaryColor,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.darkHomeUserTitle,
      onBackground: AppColors.darkHomeUserTitle,
      onError: AppColors.white,
    ),
    shadowColor: const Color(0xff1E1E1E),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      shadowColor: const Color(0xff1E1E1E),
      backgroundColor: AppColors.darkBackAppBar,
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
      color: AppColors.darkCardBg,
      elevation: 4,
      shadowColor: AppColors.darkShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.darkCardBorder, width: 1),
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
      fillColor: AppColors.darkCardBg,
      hintStyle: TextStyle(
        color: AppColors.darkHintTextField,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.regular,
      ),
      labelStyle: TextStyle(
        color: AppColors.darkTitleTextField,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.medium,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.darkUnfocusedTextFieldBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.darkUnfocusedTextFieldBorder,
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
        color: AppColors.darkHomeUserTitle,
        fontSize: 32.sp,
        fontWeight: AppFontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 28.sp,
        fontWeight: AppFontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 24.sp,
        fontWeight: AppFontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 22.sp,
        fontWeight: AppFontWeight.semiBold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 20.sp,
        fontWeight: AppFontWeight.semiBold,
      ),
      headlineSmall: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 18.sp,
        fontWeight: AppFontWeight.semiBold,
      ),
      titleLarge: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 16.sp,
        fontWeight: AppFontWeight.medium,
      ),
      titleMedium: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.medium,
      ),
      titleSmall: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.medium,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 16.sp,
        fontWeight: AppFontWeight.regular,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkHomeUserSubtitle,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.regular,
      ),
      bodySmall: TextStyle(
        color: AppColors.darkHomeUserSubtitle,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.regular,
      ),
      labelLarge: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 14.sp,
        fontWeight: AppFontWeight.medium,
      ),
      labelMedium: TextStyle(
        color: AppColors.darkHomeUserSubtitle,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.medium,
      ),
      labelSmall: TextStyle(
        color: AppColors.darkHomeUserSubtitle,
        fontSize: 10.sp,
        fontWeight: AppFontWeight.medium,
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: AppColors.darkSemiBrown, size: 24),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkAddContent,
      selectedItemColor: AppColors.mainColorStart,
      unselectedItemColor: AppColors.darkSemiBrown,
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
      color: AppColors.darkDividerColor,
      thickness: 1,
      space: 1,
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.darkSearchFillColor,
      selectedColor: AppColors.mainColorStart,
      disabledColor: AppColors.darkGrey,
      labelStyle: TextStyle(
        color: AppColors.darkHomeUserTitle,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.medium,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.mainColorStart,
      linearTrackColor: AppColors.darkUnfocusedTextFieldBorder,
    ),

    // Switch Theme
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.white;
        }
        return AppColors.darkGrey;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.mainColorStart;
        }
        return AppColors.darkUnfocusedTextFieldBorder;
      }),
    ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.mainColorStart;
        }
        return AppColors.darkAddContent;
      }),
      checkColor: MaterialStateProperty.all(AppColors.white),
      side: const BorderSide(
        color: AppColors.darkUnfocusedTextFieldBorder,
        width: 2,
      ),
    ),

    // Radio Theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.mainColorStart;
        }
        return AppColors.darkUnfocusedTextFieldBorder;
      }),
    ),
  );
}
