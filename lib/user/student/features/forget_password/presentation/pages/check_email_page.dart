import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/user/student/features/forget_password/presentation/widgets/check_email_header.dart';
import 'package:final_project_iti/user/student/features/forget_password/presentation/widgets/otp_code_boxes.dart';
import 'package:final_project_iti/user/student/features/forget_password/presentation/widgets/resend_email_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckEmailPage extends StatelessWidget {
  const CheckEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CheckEmailHeader(),
            SizedBox(height: 24.h),
            const OtpCodeBoxes(),
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
                child: Text("Verify Code", style: TextStyle(fontSize: 16.sp)),
              ),
            ),
            SizedBox(height: 16.h),
            const ResendEmailRow(),
          ],
        ),
      ),
    );
  }
}
