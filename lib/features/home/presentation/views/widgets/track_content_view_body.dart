import 'package:flutter/material.dart';

import 'track_content_list_view.dart';

class TrackContentViewBody extends StatelessWidget {
  const TrackContentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: TrackContentListView());
  }
}
