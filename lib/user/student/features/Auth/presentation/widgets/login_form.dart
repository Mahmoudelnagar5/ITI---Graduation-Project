import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/core/widgets/app_botton.dart';
import 'package:final_project_iti/core/widgets/app_text_form_field.dart';
import 'package:final_project_iti/user/student/features/Auth/controller/login_cubit/login_cubit.dart';
import 'package:final_project_iti/user/student/features/Auth/helper/validator.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/widgets/forgot_password_botton.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/widgets/password_text_field.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/widgets/text_field_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: LoginCubit.get(context).key,
        child: Column(
          children: [
            const TextFieldTitle(title: 'Email'),
            const Gap(8),
            AppTextFormField(
              hintText: 'Email',
              controller: LoginCubit.get(context).emailController,
              validator: Validator.emailValidator(),
            ),
            const Gap(16),
            const TextFieldTitle(title: 'Password'),

            const Gap(8),

            PasswordTextFormField(
              hintText: 'Password',
              controller: LoginCubit.get(context).passwordController,
              validator: Validator.loginPasswordValidator(),
            ),
            const Gap(16),

            const ForgotPasswordBotton(),
            Gap(222.h),
            AppBotton(
              child: Text(
                'Login',
                style: AppTextStyles.textStyleMedium16.copyWith(
                  color: AppColors.white,
                  fontFamily: AppFontFamily.roboto,
                ),
              ),

              onPressed: () {
                final key = LoginCubit.get(context).key;

                if (key.currentState!.validate()) {
                  LoginCubit.get(context).login();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
