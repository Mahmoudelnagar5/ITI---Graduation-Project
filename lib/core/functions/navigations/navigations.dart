import 'package:flutter/material.dart';

abstract class AppNavigation {
  //? navigation without delay
  static void pushName({
    required BuildContext context,
    required String route,
    Object? argument,
    bool rootNavigator = false,
  }) {
    Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).pushNamed(route, arguments: argument);
  }

  static void pushWithReplacement({
    required BuildContext context,
    required String route,
    bool rootNavigator = false,
  }) {
    Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).pushReplacementNamed(route);
  }

  static void pushAndRemoveUntil({
    required BuildContext context,
    required String route,
    bool rootNavigator = false,
  }) {
    Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  //? navigation with delay time
  static void navigationdelay({
    required BuildContext context,
    required String route,
  }) {
    Future.delayed(const Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, route);
    });
  }

  static void pop({required BuildContext context}) {
    Navigator.pop(context);
  }
}
