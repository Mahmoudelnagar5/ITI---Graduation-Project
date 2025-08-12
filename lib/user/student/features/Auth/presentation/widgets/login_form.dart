import 'package:final_project_iti/core/routing/route_export.dart';

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
              obscureText: false,
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
                  color: Theme.of(context).colorScheme.onPrimary,
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
