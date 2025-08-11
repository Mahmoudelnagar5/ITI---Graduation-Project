import 'package:final_project_iti/core/config/configrations.dart';
import 'package:final_project_iti/core/functions/navigations/navigations.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:flutter/material.dart';

class skipBotton extends StatelessWidget {
  const skipBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            AppNavigation.pushWithReplacement(
              context: context,
              route: AppRoutes.AuthRole,
            );
          },
          child: Text(
            "Skip",
            style: AppTextStyles.textStyleRegular20.copyWith(
              color: AppColors.mainColorStart,
              fontFamily: AppFontFamily.inter,
            ),
          ),
        ),
      ),
    );
  }
}
