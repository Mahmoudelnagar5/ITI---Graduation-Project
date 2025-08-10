import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/core/widgets/app_botton.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/app_text_form_field.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/forgot_password_botton.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        child: Column(
          children: [
            const Text('Email'),
            const AppTextFormField(hintText: 'Email'),
            const Text('Password'),
            const PasswordTextFormField(),
            const ForgotPasswordBotton(),
            AppBotton(
              onPressed: () {},
              child: Text(
                'Login',
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
