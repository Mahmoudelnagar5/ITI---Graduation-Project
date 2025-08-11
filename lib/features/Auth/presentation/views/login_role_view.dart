import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/assets_manager.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/features/Auth/data/login_role_list.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/role_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigations/navigations.dart';

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
            const Gap(8),
            Text(
              "Please select your account type",
              style: AppTextStyles.textStyleRegular16.copyWith(
                fontFamily: AppFontFamily.roboto,
              ),
            ),
            const Gap(32),
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
                        route: AppRoutes.loginView,
                      );
                    },
                  ),
                  RoleCard(
                    roleModel: roleList[2],
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.loginView,
                      );
                    },
                  ),
                ],
              ),
              // child: ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: roleList.length,
              //   itemBuilder: (context, index) {
              //     return RoleCard(
              //       title: roleList[index].title,
              //       subTitle: roleList[index].subTitle,
              //       svgAssets: roleList[index].svgAssets,

              //       // TODO add onTap to LoginRoleModel in the list
              //     );
              //   },
              // ),
            ),
            Text(
              'Select your role to proceed to login',
              style: AppTextStyles.textStyleRegular14.copyWith(
                fontFamily: AppFontFamily.roboto,
                color: AppColors.acountsubtitle,
              ),
            ),
            Gap(MediaQuery.sizeOf(context).height * 00.09),
          ],
        ),
      ),
    );
  }
}
