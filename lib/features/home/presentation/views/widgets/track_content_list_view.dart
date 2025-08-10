import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/models/track_content_model.dart';
import 'track_content_item.dart';

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
