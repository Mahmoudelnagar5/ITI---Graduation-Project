import 'package:final_project_iti/core/functions/transitions/page_route_builder_method.dart';
import 'package:final_project_iti/user/admin/features/admin_panel/presentation/pages/admin_panel_page.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/views/auth_role_view.dart';
import 'package:final_project_iti/user/student/features/Auth/presentation/views/auth_view.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/main_view.dart';
import 'package:final_project_iti/user/student/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

import '../../user/student/features/home/presentation/views/track_content_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingView(),
        );
      case AppRoutes.authRole:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AuthRoleView(),
        );
      case AppRoutes.trackContentView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const TrackContentView(),
        );
      case AppRoutes.authView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AuthView(),
        );
      case AppRoutes.mainView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MainView(),
        );
      case AppRoutes.adminPanel:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AdminPanelPage(),
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
  static const String authRole = '/AuthRole';
  static const String authView = '/AuthView';
  static const String mainView = '/mainView';
  static const String tracksView = '/tracksView';
  static const String trackContentView = '/trackContentView';
  static const String adminPanel = '/adminPanel';
}
