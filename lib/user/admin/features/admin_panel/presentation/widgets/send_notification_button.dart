import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendNotificationButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double radius;
  const SendNotificationButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColorStart,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
      ),
    );
  }
}
