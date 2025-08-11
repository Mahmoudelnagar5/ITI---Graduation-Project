import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/core/widgets/app_botton.dart';
import 'package:final_project_iti/core/widgets/app_text_form_field.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/password_text_field.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/text_field_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        child: Column(
          children: [
            const TextFieldTitle(title: 'Name'),
            const Gap(8),
            const AppTextFormField(hintText: 'Name'),
            const Gap(16),

            const TextFieldTitle(title: 'Email'),
            const Gap(8),
            const AppTextFormField(hintText: 'Email'),
            const Gap(16),
            const TextFieldTitle(title: 'Password'),
            const Gap(8),
            const PasswordTextFormField(hintText: 'Password'),
            const Gap(16),
            const TextFieldTitle(title: 'Confirm Password'),
            const Gap(8),
            const PasswordTextFormField(hintText: 'Confirm Password'),
            Gap(70.h),
            AppBotton(
              onPressed: () {},
              child: Text(
                'Register',
                style: AppTextStyles.textStyleMedium16.copyWith(
                  color: AppColors.white,
                  fontFamily: AppFontFamily.roboto,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
