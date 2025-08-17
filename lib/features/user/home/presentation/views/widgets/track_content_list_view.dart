import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/models/track_model.dart';
import 'track_content_item.dart';

class TrackContentListView extends StatelessWidget {
  const TrackContentListView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackModel =
        ModalRoute.of(context)?.settings.arguments as TrackModel?;
    final List<String> contents = trackModel!.contents;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: contents.length,
      separatorBuilder: (context, index) => const Gap(16),
      itemBuilder: (context, index) {
        return TrackContentItem(
          content: contents[index],
          index: (index + 1).toString(),
        );
      },
    );
  }
}
