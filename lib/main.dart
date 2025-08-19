import 'package:device_preview/device_preview.dart';
import 'package:final_project_iti/core/bloc_observer/bloc_observer.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/functions/network/network.dart';
import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/core/theme/theme_manager.dart';
import 'package:final_project_iti/firebase_options.dart';
import 'package:final_project_iti/l10n/app_localizations.dart';
import 'package:final_project_iti/user/admin/features/admin_panel/presentation/pages/admin_panel_page.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/localization/localization_cubit.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/localization/localization_state.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/starred_questions/starred_questions_cubit.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/theme/app_cubit.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/theme/app_state.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/main_view.dart';
import 'package:final_project_iti/user/student/features/splash_view/splash_view.dart';
import 'package:final_project_iti/user/super_admin/features/add_resource/presentation/controller/views/add_resource_view.dart';
import 'package:final_project_iti/user/super_admin/features/dashboard/presentation/views/super_admin_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
    debugPrint('Environment variables loaded successfully');
  } catch (e) {
    debugPrint('Warning: Could not load .env file: $e');
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper().init();
  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

//27.0.12077973
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => LocalizationCubit()),
        BlocProvider(create: (context) => StarredQuestionsCubit()),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,

            // splitScreenMode: true,
            builder: (context, child) {
              return BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  return MaterialApp(
                    locale: Locale(
                      LocalizationCubit.get(context).getLanguage(),
                    ),
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeManager.getLightTheme(),
                    darkTheme: ThemeManager.getDarkTheme(),
                    themeAnimationCurve: Curves.fastOutSlowIn,
                    themeAnimationDuration: const Duration(milliseconds: 2000),
                    themeMode: AppCubit.get(context).getTheme(),
                    onGenerateRoute: AppRouter.generateRoute,
                    initialRoute: initalRouteMethod(),
                    home: const SplashView(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
