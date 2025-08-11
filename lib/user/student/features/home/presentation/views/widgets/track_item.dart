import 'package:final_project_iti/user/student/features/home/data/models/track_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/configrations.dart';
import '../../../../../../../core/functions/navigations/navigations.dart';
import '../../../../../../../core/utilities/app_colors.dart';
import '../../../../../../../core/utilities/styles_manager.dart';

class TrackItem extends StatelessWidget {
  const TrackItem({super.key, required this.trackModel});
  final TrackModel trackModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigation.pushName(
          context: context,
          route: AppRoutes.trackContentView,
          rootNavigator: true,
          argument: trackModel,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 45.w,
              height: 45.h,
              decoration: ShapeDecoration(
                color: AppColors.mainColorStart.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Center(child: Image.asset(trackModel.image)),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trackModel.title,
                    style: AppTextStyles.textStyleSemiBold16.copyWith(
                      color: AppColors.hometusertitle,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    trackModel.description,
                    style: AppTextStyles.textStyleRegular14.copyWith(
                      color: AppColors.hometusersubtitle,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.hinttextfield,
                size: 20.sp,
              ),
              onPressed: () {
                AppNavigation.pushName(
                  context: context,
                  route: AppRoutes.trackContentView,
                  rootNavigator: true,
                  argument: trackModel,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
