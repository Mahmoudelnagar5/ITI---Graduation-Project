import 'package:final_project_iti/user/student/features/home/presentation/views/search_widget.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/widgets/question_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SearchTextField(
          //   hintText: 'Search for questions...',
          //   color: AppColors.mainColorStart,
          // ),
          SearchWidget(hintText: 'Search for questions...'),

          Gap(15),
          Expanded(child: QuestionListView()),
        ],
      ),
    );
  }
}
