import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/login_cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // التنقل بناءً على الدور
          if (state.role == 'admin') {
            AppNavigation.pushAndRemoveUntil(
              context: context,
              route: AppRoutes.adminPanel,
            );
          } else {
            AppNavigation.pushAndRemoveUntil(
              context: context,
              route: AppRoutes.superAdminPanel,
            );
          }
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    onPressed: state is LoginLoading
                        ? null
                        : () {
                            final key = LoginCubit.get(context).key;
                            if (key.currentState!.validate()) {
                              final email = LoginCubit.get(
                                context,
                              ).emailController.text;
                              final password = LoginCubit.get(
                                context,
                              ).passwordController.text;
                              LoginCubit.get(context).login(email, password);
                            }
                          },
                    child: state is LoginLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            'Login',
                            style: AppTextStyles.textStyleMedium16.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontFamily: AppFontFamily.roboto,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
