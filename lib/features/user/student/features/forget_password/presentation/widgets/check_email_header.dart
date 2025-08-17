import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckEmailHeader extends StatelessWidget {
  final VoidCallback? onBack;

  const CheckEmailHeader({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack ?? () {},
        ),
        SizedBox(height: 16.h),
        Text(
          "Check your email",
          style: TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "We sent a reset link to ",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              TextSpan(
                text: "moazayman128@gmail.com",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
