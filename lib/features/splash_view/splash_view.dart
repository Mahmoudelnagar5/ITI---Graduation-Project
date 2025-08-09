import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/functions/navigations/navigations.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/assets_manager.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.imagesLogo, height: 200),
            Gap(13),
            Text(
              'المعهد التكنولوجي العالي',
              style: AppTextStyles.textStyleBold24.copyWith(
                color: AppColors.mainColorStart,
                fontFamily: 'Tajawal',
              ),
            ),
            Text(
              'ITI Fayoum',
              style: AppTextStyles.textStyleMedium20.copyWith(
                color: AppColors.mainColorStart,
                fontFamily: 'Tajawal',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
