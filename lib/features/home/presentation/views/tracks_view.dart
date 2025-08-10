import 'package:flutter/material.dart';

import 'widgets/custom_app_bar.dart';
import 'widgets/tracks_view_body.dart';

class TracksView extends StatelessWidget {
  const TracksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar(), body: TrackViewBody());
  }
}
