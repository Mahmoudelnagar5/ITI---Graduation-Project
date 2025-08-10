import 'package:final_project_iti/core/functions/transitions/page_route_builder_method.dart';
import 'package:final_project_iti/features/Auth/presentation/views/login_role_view.dart';
import 'package:final_project_iti/features/Auth/presentation/views/login_view.dart';
import 'package:final_project_iti/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingView(),
        );
      case AppRoutes.loginRole:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginRoleView(),
        );
      case AppRoutes.loginView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginView(),
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
  static const String loginRole = '/loginRole';
  static const String loginView = '/loginView';
}
