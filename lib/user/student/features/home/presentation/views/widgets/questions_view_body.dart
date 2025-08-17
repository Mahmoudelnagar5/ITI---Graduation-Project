import 'package:final_project_iti/l10n/app_localizations.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/search_widget.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/widgets/question_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchWidget(
            hintText: AppLocalizations.of(context)!.searchForQuestions,
          ),

          const Gap(15),
          const Expanded(child: QuestionListView()),
        ],
      ),
    );
  }
}
