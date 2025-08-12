import 'package:final_project_iti/core/utilities/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
        SizedBox(height: 16.h),
        Text(
          "Forgot password",
          style: TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.bold),
        ),
        SizedBox(height: 20.h),
        Text(
          "Please enter your email to reset the password",
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
