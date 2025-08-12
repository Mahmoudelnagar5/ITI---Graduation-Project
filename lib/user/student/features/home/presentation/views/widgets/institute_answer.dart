import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utilities/app_colors.dart';
import '../../../../../../../core/utilities/styles_manager.dart';

class InstituteAnswer extends StatelessWidget {
  const InstituteAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.addcontant,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 8.w,
              decoration: const BoxDecoration(
                color: AppColors.mainColorStart,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Your attendance record has been updated. Please check your profile for the latest status of your attendance record.',
                  style: AppTextStyles.textStyleMedium16.copyWith(
                    color: AppColors.hometusertitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
