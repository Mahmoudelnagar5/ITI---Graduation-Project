import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'search_text_field.dart';
import 'tracks_list_view.dart';

class TrackViewBody extends StatelessWidget {
  const TrackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(hintText: 'Search tracks...'),
          Gap(24),
          Expanded(child: TracksListView()),
        ],
      ),
    );
  }
}
