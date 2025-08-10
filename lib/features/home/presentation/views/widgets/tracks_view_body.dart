import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/features/home/data/models/track_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utilities/styles_manager.dart';
import 'search_text_field.dart';

class TrackViewBody extends StatelessWidget {
  const TrackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          Gap(24),
          Expanded(child: TrackListView()),
        ],
      ),
    );
  }
}

class TrackListView extends StatelessWidget {
  const TrackListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TrackModel> trackItems =
        TrackModel.tracks; // Assuming you have a list of tracks
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: trackItems.length,
      itemBuilder: (context, index) {
        final track = trackItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TrackItem(
            title: track.title,
            description: track.description,
            imageUrl: track.image,
          ),
        );
      },
    );
  }
}

class TrackItem extends StatelessWidget {
  const TrackItem({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            width: 48.w,
            height: 48.h,
            decoration: ShapeDecoration(
              color: AppColors.mainColorStart.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Image.asset(imageUrl),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textStyleSemiBold16.copyWith(
                    color: AppColors.hometusertitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  description,
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
              // Handle navigation or action
            },
          ),
        ],
      ),
    );
  }
}
