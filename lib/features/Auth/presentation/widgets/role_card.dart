import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/features/Auth/presentation/widgets/role_icon.dart';
import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.svgAssets, this.onTap,
  });
  final String title;
  final String subTitle;
  final String svgAssets;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20, bottom: 16),
      child: InkWell(
        onTap:onTap,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromARGB(45, 102, 102, 102)),
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ListTile(
              leading: RoleIcon(svgAssets: svgAssets),
              title: Text(
                title,
                style: AppTextStyles.textStyleSemiBold18.copyWith(
                  color: AppColors.accountype,
                  fontFamily: AppFontFamily.roboto,
                ),
              ),
              subtitle: Text(
                subTitle,
                style: AppTextStyles.textStyleRegular14.copyWith(
                  color: AppColors.acountsubtitle,
                  fontFamily: AppFontFamily.roboto,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
