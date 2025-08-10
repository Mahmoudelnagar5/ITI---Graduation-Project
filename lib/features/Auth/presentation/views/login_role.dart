import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/assets_manager.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/role_card.dart';
import 'package:flutter/material.dart';

class LoginRoleView extends StatelessWidget {
  const LoginRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(Assets.imagesITIfayoumlogo, height: 120, width: 120),
            Text(
              "Welcome to ITI Fayoum",
              style: AppTextStyles.textStyleBold24.copyWith(
                fontFamily: AppFontFamily.roboto,
              ),
            ),
            Text(
              "Please select your account type",
              style: AppTextStyles.textStyleRegular16.copyWith(
                fontFamily: AppFontFamily.roboto,
              ),
            ),
            const RoleCard(),
          ],
        ),
      ),
    );
  }
}
