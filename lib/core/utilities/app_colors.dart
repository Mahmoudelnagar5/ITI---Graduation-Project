import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Colors
  static const Color mainColorStart = Color(0xff9D2235);
  static const Color adminPrimaryColor = Color(0xffFF3B30);
  static const Color adminPanelActiveIcon = Color(0xffE53935);

  // Base Colors
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);

  // ─────────────────────────────
  // Light Theme Colors
  // ─────────────────────────────
  static const Color lightScaffoldBg = Color(0xFFF6F7F8);
  static const Color lightCardBorder = Color(0xFFF7F7F9);
  static const Color lightRoleIconBackground = Color(0xffF6E9EB);
  static const Color lightAccountType = Color(0xff1A1A1A);
  static const Color lightAccountSubtitle = Color(0xff666666);
  static const Color lightSemiBrown = Color(0xff6B7280);
  static const Color lightTitleTextField = Color(0xff374151);
  static const Color lightHintTextField = Color(0xff9CA3AF);
  static const Color lightHomeUserTitle = Color(0xff111827);
  static const Color lightHomeUserSubtitle = Color(0xff4B5563);
  static const Color lightSearchFillColor = Color(0xffF3F4F6);
  static const Color lightSearchIconColor = Color(0xff6B7280);
  static const Color lightBackAppBar = Color(0xff1F2937);
  static const Color lightAddContent = Color(0xffF9FAFB);
  static const Color lightOnboardingDotColor = Color(0xffE5E5E5);
  static const Color lightUnfocusedTextFieldBorder = Color(0xffE5E5E5);
  static const Color lightSuccessGreen = Color(0xFF4CAF50);
  static const Color lightGrey = Color(0xFF9E9E9E);
  static const Color lightCardBg = Color(0xFFFFFFFF);
  static const Color lightDividerColor = Color(0xFFE5E7EB);
  static const Color lightShadowColor = Color(0x1A000000);
  static const Color lightErrorColor = Color(0xFFDC2626);
  static const Color lightWarningColor = Color(0xFFF59E0B);
  static const Color lightInfoColor = Color(0xFF3B82F6);

  // ─────────────────────────────
  // Dark Theme Colors (Refined)
  // ─────────────────────────────
  static const Color darkScaffoldBg = Color(0xFF121212); // true dark
  static const Color darkCardBorder = Color(0xFF1E1E1E);
  static const Color darkRoleIconBackground = Color(0xFF2D1F22);
  static const Color darkAccountType = Color(0xFFECECEC);
  static const Color darkAccountSubtitle = Color(0xFFBDBDBD);
  static const Color darkSemiBrown = Color(0xFF9E9E9E);
  static const Color darkTitleTextField = Color(0xFFE0E0E0);
  static const Color darkHintTextField = Color(0xFF9A9A9A);
  static const Color darkHomeUserTitle = Color(0xFFFFFFFF);
  static const Color darkHomeUserSubtitle = Color(0xFFB0B0B0);
  static const Color darkSearchFillColor = Color(0xFF1E1E1E);
  static const Color darkSearchIconColor = Color(0xFFB0B0B0);
  static const Color darkBackAppBar = Color(0xFF181818);
  static const Color darkAddContent = Color(0xFF1E1E1E);
  static const Color darkOnboardingDotColor = Color(0xFF3A3A3A);
  static const Color darkUnfocusedTextFieldBorder = Color(0xFF3A3A3A);
  static const Color darkSuccessGreen = Color(0xFF66BB6A);
  static const Color darkGrey = Color(0xFF9E9E9E);
  static const Color darkCardBg = Color(0xFF1E1E1E);
  static const Color darkDividerColor = Color(0xFF424242);
  static const Color darkShadowColor = Color(0x40000000);
  static const Color darkErrorColor = Color(0xFFEF4444);
  static const Color darkWarningColor = Color(0xFFFBBF24);
  static const Color darkInfoColor = Color(0xFF60A5FA);

  // Legacy (Light) defaults for backward compatibility
  static const Color roleIconBackground = lightRoleIconBackground;
  static const Color accountype = lightAccountType;
  static const Color acountsubtitle = lightAccountSubtitle;
  static const Color semibrown = lightSemiBrown;
  static const Color titletextfield = lightTitleTextField;
  static const Color hinttextfield = lightHintTextField;
  static const Color hometusertitle = lightHomeUserTitle;
  static const Color hometusersubtitle = lightHomeUserSubtitle;
  static const Color searchfillcolor = lightSearchFillColor;
  static const Color searchIconcolor = lightSearchIconColor;
  static const Color backappbar = lightBackAppBar;
  static const Color addcontant = lightAddContent;
  static const Color onboardindDotColor = lightOnboardingDotColor;
  static const Color unfocusedTextFieldBorder = lightUnfocusedTextFieldBorder;
  static const Color successGreen = lightSuccessGreen;
  static const Color scaffoldBg = lightScaffoldBg;
  static const Color cardBorder = lightCardBorder;
}
