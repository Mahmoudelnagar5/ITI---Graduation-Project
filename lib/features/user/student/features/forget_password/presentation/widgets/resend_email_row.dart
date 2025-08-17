import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendEmailRow extends StatelessWidget {
  final VoidCallback? onResend;

  const ResendEmailRow({super.key, this.onResend});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Haven't got the email yet? ",
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
        GestureDetector(
          onTap: onResend,
          child: Text(
            "Resend email",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.mainColorStart,
              fontWeight: AppFontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
