import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/assets_manager.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsManager.imagesLogo, height: 200),
          const Gap(13),
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
    );
  }
}
