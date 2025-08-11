import 'package:final_project_iti/features/home/presentation/views/resources_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/styles_manager.dart';
import 'questions_view.dart';
import 'tracks_view.dart';

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
    const TracksView(),
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
    return PersistentTabView(
      context,
      controller: controller,
      screens: _pages,
      items: items(),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> items() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: 'Home',
      activeColorPrimary: AppColors.adminpanelactivateicon,
      inactiveColorPrimary: AppColors.hometusersubtitle,
      textStyle: AppTextStyles.textStyleRegular12,
    ),

    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.book),
      title: 'Resources',
      textStyle: AppTextStyles.textStyleRegular12,
      activeColorPrimary: AppColors.adminpanelactivateicon,
      inactiveColorPrimary: AppColors.hometusersubtitle,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.question_circle),
      title: 'Questions',
      activeColorPrimary: AppColors.adminpanelactivateicon,
      inactiveColorPrimary: AppColors.hometusersubtitle,
      textStyle: AppTextStyles.textStyleRegular12,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person),
      title: 'Profile',
      textStyle: AppTextStyles.textStyleRegular12,
      activeColorPrimary: AppColors.adminpanelactivateicon,
      inactiveColorPrimary: AppColors.hometusersubtitle,
    ),
  ];
}
