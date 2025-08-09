import 'package:final_project_iti/core/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/functions/network/network.dart';
import 'package:final_project_iti/features/splash_view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CasheHelper().init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initalRouteMethod(),

      home: SplashView(),
    );
  }
}
