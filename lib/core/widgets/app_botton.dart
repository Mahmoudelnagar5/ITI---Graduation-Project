import 'package:final_project_iti/core/utilities/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBotton extends StatelessWidget {
  const AppBotton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color,
  });
  final Widget child;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.mainColorStart,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        child: child,
      ),
    );
  }
}
