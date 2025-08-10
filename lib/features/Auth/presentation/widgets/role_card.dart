import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/role_icon.dart';
import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color.fromARGB(45, 102, 102, 102)),
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ListTile(
            leading: const RoleIcon(),
            title: Text(
              "User",
              style: AppTextStyles.textStyleSemiBold18.copyWith(
                color: AppColors.accountype,
                fontFamily: AppFontFamily.roboto,
              ),
            ),
            subtitle: Text(
              "Students and course participants",
              style: AppTextStyles.textStyleRegular14.copyWith(
                color: AppColors.acountsubtitle,
                fontFamily: AppFontFamily.roboto,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
