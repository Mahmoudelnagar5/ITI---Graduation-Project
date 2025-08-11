import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.successGreen.withOpacity(0.12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: 32.sp,
                      color: AppColors.successGreen,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  'Notification Sent Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Your Q&A notification has been sent to all students',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.acountsubtitle,
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColorStart,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
