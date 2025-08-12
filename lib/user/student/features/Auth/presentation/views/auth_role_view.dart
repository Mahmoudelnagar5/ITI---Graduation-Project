import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/Auth/data/login_role_list.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/widgets/role_card.dart';

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
