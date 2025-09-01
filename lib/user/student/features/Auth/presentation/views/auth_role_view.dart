import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/views/team_members.dart';

class AuthRoleView extends StatelessWidget {
  const AuthRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              flex: 30,
              child: ListView(
                padding: EdgeInsets.only(bottom: 20.h),
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
                      subTitle: AppLocalizations.of(
                        context,
                      )!.systemAdministratorsAndManagers,
                      svgAssets: Assets.imagesSuperAdminIcon,
                    ),
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.authView,
                      );
                    },
                  ),
                  Gap(16.h),
                  // Team Members Card
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.4),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.r),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const TeamMembersPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Row(
                              children: [
                                Container(
                                  width: 45.w,
                                  height: 45.w,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Theme.of(
                                          context,
                                        ).colorScheme.primary.withOpacity(0.8),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary.withOpacity(0.2),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.group,
                                    color: Colors.white,
                                    size: 24.r,
                                  ),
                                ),
                                Gap(16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Meet Our Team",
                                        style: AppTextStyles.textStyleSemiBold18
                                            .copyWith(
                                              fontSize: 16.sp,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurface,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Gap(2.h),
                                      Text(
                                        "Learn about the developers behind this app",
                                        style: AppTextStyles.textStyleRegular14
                                            .copyWith(
                                              fontSize: 13.sp,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withOpacity(0.6),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(6.r),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    size: 14.r,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
