import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utilities/app_colors.dart';
import 'question_list_view.dart';
import 'search_text_field.dart';

class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(
            hintText: 'Search for questions...',
            color: AppColors.mainColorStart,
          ),
          Gap(15),
          Expanded(child: QuestionListView()),
        ],
      ),
    );
  }
}
