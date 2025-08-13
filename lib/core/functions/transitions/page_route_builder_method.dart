import 'package:final_project_iti/core/functions/transitions/slide_transation_builder.dart';
import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> pageRouteBuilderMethod({
  required Widget Function(BuildContext, Animation<double>, Animation<double>)
  pageBuilder,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 550),
    transitionsBuilder: slideTransitionBuilder,
    pageBuilder: pageBuilder,
  );
}
