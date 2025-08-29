import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper_keys.dart';
import 'package:final_project_iti/core/routing/route_export.dart';

import 'package:final_project_iti/user/student/features/splash_view/widgets/splash_body.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool firstTime =
        CacheHelper().getData(key: CasheKeys.firstTime) as bool? ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      AppNavigation.pushWithReplacement(
        context: context,
        route: firstTime ? AppRoutes.authRole : AppRoutes.onboardingView,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      body: const SplashBody(),
    );
  }
}
