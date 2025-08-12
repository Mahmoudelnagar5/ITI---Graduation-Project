import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/functions/network/network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'users/super_admin/features/dashboard/presentation/views/super_admin_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper().init();

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
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

          home: const SuperAdminView(),
        );
      },
    );
  }
}
