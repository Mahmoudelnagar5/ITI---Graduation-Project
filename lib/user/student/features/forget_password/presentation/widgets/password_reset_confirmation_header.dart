import 'package:final_project_iti/core/utilities/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetConfirmationHeader extends StatelessWidget {
  const PasswordResetConfirmationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
        SizedBox(height: 16.h),
        Text(
          "Password reset",
          style: TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text(
          "Your password has been successfully reset. "
          "Click confirm to set a new password",
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
