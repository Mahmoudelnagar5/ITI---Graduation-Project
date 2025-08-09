import 'package:final_project_iti/core/functions/transitions/page_route_builder_method.dart';
import 'package:final_project_iti/features/onboarding/onboarding_view/onboarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const onboardingView(),
        );

      default:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Scaffold(),
        );
    }
  }
}

abstract class AppRoutes {
  static const String splashView = '/';
  static const String onboardingView = '/onboardingView';
}
