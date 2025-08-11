import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBotton extends StatelessWidget {
  const ForgotPasswordBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
// TODO  add onTap
        },
        child: Text(
          "Forgot Password",
          style: AppTextStyles.textStyleMedium14.copyWith(
            color: AppColors.mainColorStart,
            fontFamily: AppFontFamily.roboto,
          ),
        ),
      ),
    );
  }
}
