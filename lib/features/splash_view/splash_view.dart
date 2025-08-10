import 'package:final_project_iti/core/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/cashe_helper/cashe_helper_keys.dart';
import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/functions/navigations/navigations.dart';


import 'package:final_project_iti/features/splash_view/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {

    bool? firstTime =
        CasheHelper().getData(CasheKeys.firstTime) as bool? ?? true;
    Future.delayed(const Duration(seconds: 3), () {
      AppNavigation.pushWithReplacement(
        context: context,
        route: firstTime ? AppRoutes.onboardingView : AppRoutes.loginRole,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashBody());
  }
}
