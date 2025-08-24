import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/widgets/app_text_form_field.dart';
import 'package:final_project_iti/user/student/features/Auth/helper/validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/forgot_password_header.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ForgotPasswordHeader(),

            SizedBox(height: 60.h),

            AppTextFormField(
              hintText: "Enter Your Email",
              controller: TextEditingController(),
              validator:Validator.emailValidator(),
            ),
            SizedBox(height: 50.h),

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
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
