import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper_keys.dart';
import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/functions/navigations/navigations.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';

import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/core/widgets/app_botton.dart';
import 'package:final_project_iti/features/onboarding/data/onboarding_list.dart';
import 'package:final_project_iti/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:final_project_iti/features/onboarding/presentation/widgets/skip_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    CasheHelper().saveData(key: CasheKeys.firstTime, value: false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const skipBotton(),
            OnboardingBody(
              pageController: _pageController,
              onPageChanged: (p0) {
                setState(() {
                  pageIndex = p0;
                });
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppBotton(
                child: Text(
                  pageIndex == onboardingDataList.length - 1
                      ? 'Get Started'
                      : 'Next',
                  style: AppTextStyles.textStyleRegular20.copyWith(
                    color: AppColors.white,
                    fontFamily: AppFontFamily.inter,
                  ),
                ),
                onPressed: () {
                  pageIndex == onboardingDataList.length - 1
                      ? AppNavigation.pushWithReplacement(
                          context: context,
                          route: AppRoutes.AuthRole,
                        )
                      : _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                },
              ),
            ),
            Gap(145.h),
          ],
        ),
      ),
    );
  }
}
