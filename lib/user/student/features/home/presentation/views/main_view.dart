import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/l10n/app_localizations.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';

import 'package:flutter/cupertino.dart';

import 'profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late PersistentTabController controller;
  final List<Widget> _pages = [
    const TracksView(),
    const ResourcesPage(),
    const QuestionsView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingDraggableWidget(
      // isDraggable: true,
      floatingWidget: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          AppNavigation.pushName(context: context, route: AppRoutes.chatAI);
        },
        child: Image.asset(Assets.imagesBot, width: 50.w, height: 50.h),
      ),
      floatingWidgetHeight: 50.h,
      floatingWidgetWidth: 50.h,

      mainScreenWidget: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,

        child: PersistentTabView(
          context,
          controller: controller,
          screens: _pages,
          items: [
            PersistentBottomNavBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: '  ${AppLocalizations.of(context)!.home}',
              activeColorPrimary: AppColors.mainColorStart,
              inactiveColorPrimary: AppColors.lightHomeUserSubtitle,
              textStyle: AppTextStyles.textStyleRegular16,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(CupertinoIcons.book),
              title: '  ${AppLocalizations.of(context)!.resources}',
              textStyle: AppTextStyles.textStyleRegular16,
              activeColorPrimary: AppColors.mainColorStart,
              inactiveColorPrimary: AppColors.lightHomeUserSubtitle,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(CupertinoIcons.question_circle),
              title: '  ${AppLocalizations.of(context)!.questions}',
              activeColorPrimary: AppColors.mainColorStart,
              inactiveColorPrimary: AppColors.lightHomeUserSubtitle,
              textStyle: AppTextStyles.textStyleRegular16,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(CupertinoIcons.person),
              title: '  ${AppLocalizations.of(context)!.profile}',
              textStyle: AppTextStyles.textStyleRegular16,
              activeColorPrimary: AppColors.mainColorStart,
              inactiveColorPrimary: AppColors.lightHomeUserSubtitle,
            ),
          ],
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              duration: Duration(milliseconds: 300),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
          ),
        ),
      ),
    );
  }
}
