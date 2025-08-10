import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'font_manager.dart';

abstract class AppTextStyles {
  // Light - 300
  static TextStyle textStyleLight12 = TextStyle(
    fontWeight: AppFontWieght.light,
  );
  static TextStyle textStyleLight13 = TextStyle(
    fontWeight: AppFontWieght.light,
  );
  static TextStyle textStyleLight14 = TextStyle(
    fontWeight: AppFontWieght.light,
  );

  // Regular - 400
  static TextStyle textStyleRegular12 = TextStyle(
    fontWeight: AppFontWieght.regular,
    fontSize: 12.sp,
  );
  static TextStyle textStyleRegular14 = TextStyle(
    fontWeight: AppFontWieght.regular,
    fontSize: 14.sp,
  );
  static TextStyle textStyleRegular16 = TextStyle(
    fontWeight: AppFontWieght.regular,
    fontSize: 16.sp,
  );
  static TextStyle textStyleRegular20 = TextStyle(
    fontWeight: AppFontWieght.regular,
    fontSize: 20.sp,
  );
  static TextStyle textStyleRegular24 = TextStyle(
    fontWeight: AppFontWieght.regular,
    fontSize: 24.sp,
  );

  // Medium - 500

  static TextStyle textStyleMedium14 = TextStyle(
    fontWeight: AppFontWieght.medium,
    fontSize: 14.sp,
  );
  static TextStyle textStyleMedium16 = TextStyle(
    fontWeight: AppFontWieght.medium,
    fontSize: 16.sp,
  );
  static TextStyle textStyleMedium18 = TextStyle(
    fontWeight: AppFontWieght.medium,
    fontSize: 18.sp,
  );
  static TextStyle textStyleMedium20 = TextStyle(
    fontWeight: AppFontWieght.medium,
    fontSize: 20.sp,
  );
  // semiBold - 600
  static TextStyle textStyleSemiBold18 = TextStyle(
    fontWeight: AppFontWieght.semiBold,
    fontSize: 18.sp,
  );
  static TextStyle textStyleSemiBold16 = TextStyle(
    fontWeight: AppFontWieght.semiBold,
    fontSize: 16.sp,
  );
  static TextStyle textStyleSemiBold20 = TextStyle(
    fontWeight: AppFontWieght.semiBold,
    fontSize: 20.sp,
  );
  // bold - 700
  static TextStyle textStyleBold20 = TextStyle(
    fontWeight: AppFontWieght.bold,
    fontSize: 20.sp,
  );
  static TextStyle textStyleBold24 = TextStyle(
    fontWeight: AppFontWieght.bold,
    fontSize: 24.sp,
  );
}
