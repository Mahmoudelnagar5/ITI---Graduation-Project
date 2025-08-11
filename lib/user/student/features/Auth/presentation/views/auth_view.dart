import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/assets_manager.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/user/student/features/Auth/controller/register_cubit/register_cubit.dart';
import 'package:final_project_iti/user/student/features/Auth/controller/login_cubit/login_cubit.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/widgets/login_form.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/widgets/register_form.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/widgets/tab_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
