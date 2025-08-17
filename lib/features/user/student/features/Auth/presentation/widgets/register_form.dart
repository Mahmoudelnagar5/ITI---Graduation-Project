import 'package:final_project_iti/core/routing/route_export.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: RegisterCubit.get(context).key,

          child: Column(
            children: [
              const TextFieldTitle(title: 'Name'),
              const Gap(8),
              AppTextFormField(
                hintText: 'Name',
                controller: RegisterCubit.get(context).nameController,
                validator: Validator.signupNameValidator(),
              ),
              const Gap(16),

              const TextFieldTitle(title: 'Email'),
              const Gap(8),
              AppTextFormField(
                hintText: 'Email',
                controller: RegisterCubit.get(context).emailController,
                validator: Validator.emailValidator(),
              ),
              const Gap(16),
              const TextFieldTitle(title: 'Password'),
              const Gap(8),
              PasswordTextFormField(
                hintText: 'Password',
                controller: RegisterCubit.get(context).passwordController,
                validator: Validator.signupPasswordValidator(),
              ),
              const Gap(16),
              const TextFieldTitle(title: 'Confirm Password'),
              const Gap(8),
              PasswordTextFormField(
                hintText: 'Confirm Password',
                controller: RegisterCubit.get(
                  context,
                ).confirmPasswordController,
                validator: Validator.confirmPasswordValidator(
                  orgPasswordGetter: () =>
                      RegisterCubit.get(context).passwordController.text,
                ),
              ),
              Gap(70.h),
              AppBotton(
                child: Text(
                  'Register',
                  style: AppTextStyles.textStyleMedium16.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontFamily: AppFontFamily.roboto,
                  ),
                ),
                onPressed: () {
                  final key = RegisterCubit.get(context).key;
                  if (key.currentState!.validate()) {
                    RegisterCubit.get(context).register();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
