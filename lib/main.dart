export 'package:device_preview/device_preview.dart';
import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/main.dart';
import 'package:final_project_iti/user/admin/features/admin_panel/presentation/views/admin_dashboard_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
    debugPrint('Environment variables loaded successfully');
  } catch (e) {
    debugPrint('Warning: Could not load .env file: $e');
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Firebase Messaging and Notifications
  // await FirebaseApi().initNotification();
  debugPrint('FirebaseApi initialized successfully.');

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
