import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/utilities/styles_manager.dart';
import '../../data/models/track_model.dart';
import 'widgets/track_content_view_body.dart';

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
