import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/user/student/features/forget_password/presentation/widgets/password_reset_confirmation_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetConfirmationPage extends StatelessWidget {
  const PasswordResetConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PasswordResetConfirmationHeader(),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColorStart,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {},
                child: Text("Confirm", style: TextStyle(fontSize: 16.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
