import 'package:final_project_iti/core/bloc_observer/bloc_observer.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/functions/network/network.dart';
import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/app_cubit.dart';
import 'package:final_project_iti/user/student/features/splash_view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,

        // splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => AppCubit(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeAnimationCurve: Curves.fastOutSlowIn,
              themeAnimationDuration: const Duration(milliseconds: 1500),
              themeMode: AppCubit.get(context).getTheme(),
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: initalRouteMethod(),

              home: const SplashView(),
            ),
          );
        },
      ),
    );
  }
}
