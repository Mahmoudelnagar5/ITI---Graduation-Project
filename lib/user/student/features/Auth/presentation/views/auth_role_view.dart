import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/l10n/app_localizations.dart';

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
              maxLines: 2,
              textAlign: TextAlign.center,
              AppLocalizations.of(context)!.welcomeToItiFayoum,
              style: AppTextStyles.textStyleBold24.copyWith(
                fontSize: 20.sp,
                fontFamily: AppFontFamily.roboto,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Gap(8.h),
            Text(
              AppLocalizations.of(context)!.pleaseSelectYourAccountType,
              style: AppTextStyles.textStyleRegular16.copyWith(
                fontFamily: AppFontFamily.roboto,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            Gap(32.h),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  RoleCard(
                    roleModel: LoginRoleModel(
                      title: AppLocalizations.of(context)!.user,
                      subTitle: AppLocalizations.of(
                        context,
                      )!.studentsAndCourseParticipants,
                      svgAssets: Assets.imagesUserIcon,
                    ),
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.mainView,
                      );
                    },
                  ),
                  RoleCard(
                    roleModel: LoginRoleModel(
                      title: AppLocalizations.of(context)!.admin,
                      subTitle: AppLocalizations.of(
                        context,
                      )!.courseInstructorsAndStaffMembers,
                      svgAssets: Assets.imagesAdminIcon,
                    ),
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.authView,
                      );
                    },
                  ),
                  RoleCard(
                    roleModel: LoginRoleModel(
                      title: AppLocalizations.of(context)!.superAdmin,
                      subTitle: AppLocalizations.of(context)!.systemAdministratorsAndManagers,
                      svgAssets: Assets.imagesSuperAdminIcon,
                    ),
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
             AppLocalizations.of(context)!.selectYourRoleToProceedToLogin,
              style: AppTextStyles.textStyleRegular14.copyWith(
                fontFamily: AppFontFamily.roboto,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            Gap(130.h),
          ],
        ),
      ),
    );
  }
}
