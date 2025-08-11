import 'package:final_project_iti/features/home/presentation/views/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'search_text_field.dart';
import 'tracks_list_view.dart';

class TrackViewBody extends StatelessWidget {
  const TrackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(12.h),
          const SearchWidget(hintText: 'Search Tracks'),
          // SearchTextField(hintText: 'Search tracks...'),
          const Gap(24),
          const Expanded(child: TracksListView()),
        ],
      ),
    );
  }
}
