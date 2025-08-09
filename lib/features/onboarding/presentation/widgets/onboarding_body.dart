import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/features/onboarding/data/onboarding_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.pageController,
    this.onPageChanged,
  });
  final PageController pageController;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        itemCount: onboardingDataList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 32),
                child: Image.asset(onboardingDataList[index].image),
              ),
              Text(
                onboardingDataList[index].title,
                style: AppTextStyles.textStyleRegular24.copyWith(
                  fontFamily: 'Inter',
                ),
              ),
              const Gap(16),
              Text(
                textAlign: TextAlign.center,
                onboardingDataList[index].subTitle,

                style: AppTextStyles.textStyleRegular16.copyWith(
                  color: AppColors.acountsubtitle,
                  fontFamily: 'Inter',
                ),
              ),
              const Gap(32),
              SmoothPageIndicator(
                controller: pageController,
                count: onboardingDataList.length,
                effect: const WormEffect(
                  dotColor: AppColors.onboardindDotColor,
                  activeDotColor: AppColors.mainColorStart,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}
