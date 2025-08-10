import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/assets_manager.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginRoleView extends StatelessWidget {
  const LoginRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(
              Assets.imagesITIfayoumlogo,
              height: 120.h,
              width: 120.w,
            ),
            Text(
              "Welcome to ITI Fayoum",
              style: AppTextStyles.textStyleBold20.copyWith(
                fontFamily: AppFontFamily.roboto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
