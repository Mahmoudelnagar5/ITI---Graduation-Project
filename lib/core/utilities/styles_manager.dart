import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'font_manager.dart';

abstract class AppTextStyles {
  // Light - 300
  static TextStyle textStyleLight12 = TextStyle(
    fontWeight: AppFontWeight.light,
  );
  static TextStyle textStyleLight13 = TextStyle(
    fontWeight: AppFontWeight.light,
  );
  static TextStyle textStyleLight14 = TextStyle(
    fontWeight: AppFontWeight.light,
  );

  // Regular - 400
  static TextStyle textStyleRegular12 = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: 12.sp,
  );
  static TextStyle textStyleRegular14 = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: 14.sp,
  );
  static TextStyle textStyleRegular16 = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: 16.sp,
  );
  static TextStyle textStyleRegular20 = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: 20.sp,
  );
  static TextStyle textStyleRegular24 = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: 24.sp,
  );

  // Medium - 500

  static TextStyle textStyleMedium14 = TextStyle(
    fontWeight: AppFontWeight.medium,
    fontSize: 14.sp,
  );
  static TextStyle textStyleMedium16 = TextStyle(
    fontWeight: AppFontWeight.medium,
    fontSize: 16.sp,
  );
  static TextStyle textStyleMedium18 = TextStyle(
    fontWeight: AppFontWeight.medium,
    fontSize: 18.sp,
  );
  static TextStyle textStyleMedium20 = TextStyle(
    fontWeight: AppFontWeight.medium,
    fontSize: 20.sp,
  );
  // semiBold - 600
  static TextStyle textStyleSemiBold18 = TextStyle(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 18.sp,
  );
  static TextStyle textStyleSemiBold16 = TextStyle(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 16.sp,
  );
  static TextStyle textStyleSemiBold20 = TextStyle(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 20.sp,
  );
  // bold - 700
  static TextStyle textStyleBold16 = TextStyle(
    fontWeight: AppFontWeight.bold,
    fontSize: 16.sp,
  );
  static TextStyle textStyleBold20 = TextStyle(
    fontWeight: AppFontWeight.bold,
    fontSize: 20.sp,
  );
  static TextStyle textStyleBold24 = TextStyle(
    fontWeight: AppFontWeight.bold,
    fontSize: 24.sp,
  );

  /// Resources Page Styles
  // Common radii
  static const cardRadius = 12.0;
  static const smallRadius = 8.0;

  // Shadows
  static final cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.03),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  // Common paddings
  static const pagePadding = EdgeInsets.symmetric(horizontal: 16, vertical: 18);
}
