import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/assets_manager.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesITIfayoumlogo, height: 120, width: 120),

              Text(
                'ITI Fayoum',
                style: AppTextStyles.textStyleBold20.copyWith(
                  fontFamily: AppFontFamily.roboto,
                  color: AppColors.mainColorStart,
                ),
              ),
              const SizedBox(
                height: 50,
                child: TabBar(
                  tabs: [Text('Login'), Text('Register')],
                  indicatorColor: AppColors.mainColorStart,
                ),
              ),
              const Expanded(
                child: TabBarView(children: [LoginForm(), Text('data')]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
