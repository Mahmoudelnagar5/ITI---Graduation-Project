import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/styles_manager.dart';
import '../../../data/models/track_content_model.dart';

class TrackContentItem extends StatelessWidget {
  const TrackContentItem({
    super.key,
    required this.trackContent,
    required this.index,
  });
  final TrackContentModel trackContent;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45.w,
          height: 45.h,
          decoration: const BoxDecoration(
            color: AppColors.mainColorStart,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '0$index',
              style: AppTextStyles.textStyleBold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trackContent.title,
                style: AppTextStyles.textStyleSemiBold16.copyWith(
                  color: AppColors.hometusertitle,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                trackContent.description,
                style: AppTextStyles.textStyleRegular14.copyWith(
                  color: AppColors.hometusersubtitle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
