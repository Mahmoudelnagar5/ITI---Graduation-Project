import 'package:final_project_iti/core/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/cashe_helper/cashe_helper_keys.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';

import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/core/widgets/app_botton.dart';
import 'package:final_project_iti/features/onboarding/onboarding_view/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class onboardingView extends StatefulWidget {
  const onboardingView({super.key});

  @override
  State<onboardingView> createState() => _onboardingViewState();
}

class _onboardingViewState extends State<onboardingView> {
  late final PageController _pageController;
  late double height;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    CasheHelper().saveData(key: CasheKeys.firstTime, value: true);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Skip",
                    style: AppTextStyles.textStyleRegular20.copyWith(
                      color: AppColors.mainColorStart,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ),

            onboardingBody(pageController: _pageController),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppBotton(
                child: Text(
                  'Next',
                  style: AppTextStyles.textStyleRegular20.copyWith(
                    color: AppColors.white,
                    fontFamily: 'Inter',
                  ),
                ),
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            Gap(height * 0.145),
          ],
        ),
      ),
    );
  }
}
