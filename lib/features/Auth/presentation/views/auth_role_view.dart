import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/assets_manager.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/features/Auth/data/login_role_list.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/role_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigations/navigations.dart';

class AuthRoleView extends StatelessWidget {
  const AuthRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Welcome to ITI Fayoum",
              style: AppTextStyles.textStyleBold24.copyWith(
                fontFamily: AppFontFamily.roboto,
              ),
            ),
            Gap(8.h),
            Text(
              "Please select your account type",
              style: AppTextStyles.textStyleRegular16.copyWith(
                fontFamily: AppFontFamily.roboto,
              ),
            ),
            Gap(32.h),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  RoleCard(
                    roleModel: roleList[0],
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.mainView,
                      );
                    },
                  ),
                  RoleCard(
                    roleModel: roleList[1],
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.authView,
                      );
                    },
                  ),
                  RoleCard(
                    roleModel: roleList[2],
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.authView,
                      );
                    },
                  ),
                ],
              ),
            ),
            Text(
              'Select your role to proceed to login',
              style: AppTextStyles.textStyleRegular14.copyWith(
                fontFamily: AppFontFamily.roboto,
                color: AppColors.acountsubtitle,
              ),
            ),
            Gap(130.h),
          ],
        ),
      ),
    );
  }
}
