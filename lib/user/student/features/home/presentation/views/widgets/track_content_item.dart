import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utilities/styles_manager.dart';
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
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '0$index',
              style: AppTextStyles.textStyleBold16.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
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
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                trackContent.description,
                style: AppTextStyles.textStyleRegular14.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
