import 'package:final_project_iti/users/student/features/home/presentation/views/widgets/track_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/track_model.dart';

class TracksListView extends StatelessWidget {
  const TracksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TrackModel> trackItems = TrackModel.tracks;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: trackItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TrackItem(trackModel: trackItems[index]),
        );
      },
    );
  }
}
