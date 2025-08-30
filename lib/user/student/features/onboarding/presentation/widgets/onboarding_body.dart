import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/user/student/features/onboarding/data/onboarding_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                padding: const EdgeInsets.only(top: 14),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(onboardingDataList[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 250,
                  width: 326,
                ),
              ),
              Gap(20.h),
              Text(
                onboardingDataList[index].title,
                style: AppTextStyles.textStyleBold24.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontFamily: AppFontFamily.inter,
                ),
              ),
              Gap(12.h),
              Text(
                textAlign: TextAlign.center,
                onboardingDataList[index].subTitle,

                style: AppTextStyles.textStyleRegular16.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                  fontFamily: AppFontFamily.inter,
                ),
              ),
              const Expanded(child: SizedBox()),
              SmoothPageIndicator(
                controller: pageController,
                count: onboardingDataList.length,
                effect: WormEffect(
                  dotColor: Theme.of(context).colorScheme.outline,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotHeight: 12.h,
                  dotWidth: 12.w,
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
