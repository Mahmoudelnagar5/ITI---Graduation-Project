import 'package:final_project_iti/core/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/functions/network/network.dart';
import 'package:final_project_iti/features/home/presentation/views/main_view.dart';
import 'package:final_project_iti/features/splash_view/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,

      // splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),

          themeMode: ThemeMode.system,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: initalRouteMethod(),

          home: const MainView(),
        );
      },
    );
  }
}
