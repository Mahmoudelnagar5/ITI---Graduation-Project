import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/assets_manager.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/tracks_view_body.dart';

class TracksView extends StatelessWidget {
  const TracksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar(), body: TrackViewBody());
  }
}
