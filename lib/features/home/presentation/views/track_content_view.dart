import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/utilities/styles_manager.dart';
import '../../data/models/track_content_model.dart';
import '../../data/models/track_model.dart';

class TrackContentView extends StatelessWidget {
  const TrackContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackModel =
        ModalRoute.of(context)?.settings.arguments as TrackModel?;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.mainColorStart,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              trackModel?.title ?? 'Track Title',
              style: AppTextStyles.textStyleBold20,
            ),

            Text(
              '5 Topics • 12 Weeks',
              style: AppTextStyles.textStyleRegular14,
            ),
          ],
        ),
      ),
      body: const TrackContentViewBody(),
    );
  }
}

class TrackContentListView extends StatelessWidget {
  const TrackContentListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TrackContentModel> tracksContent =
        TrackContentModel.trackContents;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: tracksContent.length,
      separatorBuilder: (context, index) => const Gap(16),
      itemBuilder: (context, index) {
        return TrackContentItem(
          trackContent: tracksContent[index],
          index: (index + 1).toString(),
        );
      },
    );
  }
}

class TrackContentViewBody extends StatelessWidget {
  const TrackContentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: TrackContentListView());
  }
}

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
