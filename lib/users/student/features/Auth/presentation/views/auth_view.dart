import 'package:final_project_iti/core/routing/route_export.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesITIfayoumlogo,
                height: 120.r,
                width: 120.r,
              ),

              Text(
                'ITI Fayoum',
                style: AppTextStyles.textStyleBold20.copyWith(
                  fontFamily: AppFontFamily.roboto,
                  color: AppColors.mainColorStart,
                ),
              ),
              SizedBox(
                height: 50.h,
                child: const TabBar(
                  tabs: [
                    TabTextWidget(text: 'Login'),
                    TabTextWidget(text: 'Register'),
                  ],

                  indicatorColor: AppColors.mainColorStart,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.mainColorStart,
                ),
              ),
              const Gap(32),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocProvider(
                      create: (BuildContext context) => LoginCubit(),
                      child: const LoginForm(),
                    ),
                    BlocProvider(
                      create: (BuildContext context) => RegisterCubit(),
                      child: const RegisterForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
