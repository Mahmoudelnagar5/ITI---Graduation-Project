import 'package:final_project_iti/core/utilities/app_colors.dart';

import 'package:flutter/material.dart';

class AppBotton extends StatelessWidget {
  const AppBotton({super.key, required this.child,required this.onPressed});
  final Widget child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColorStart,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        child: child,
      ),
    );
  }
}
