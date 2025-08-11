import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoleIcon extends StatelessWidget {
  const RoleIcon({super.key, required this.svgAssets});
  final String svgAssets;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.roleIconBackground,
      radius: 48,
      child: SvgPicture.asset(svgAssets, width: 30),
    );
  }
}
