import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/assets_manager.dart';
import '../../../../../core/utilities/styles_manager.dart';
import 'search_text_field.dart';

class TrackViewBody extends StatelessWidget {
  const TrackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SearchTextField(), SizedBox(height: 16)],
        ),
      ),
    );
  }
}
