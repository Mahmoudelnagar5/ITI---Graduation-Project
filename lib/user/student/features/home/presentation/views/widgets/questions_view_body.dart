import 'package:final_project_iti/l10n/app_localizations.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/search_widget.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/widgets/question_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuestionsViewBody extends StatefulWidget {
  const QuestionsViewBody({super.key});

  @override
  State<QuestionsViewBody> createState() => _QuestionsViewBodyState();
}

class _QuestionsViewBodyState extends State<QuestionsViewBody> {
  final GlobalKey<QuestionListViewState> _questionListViewKey =
      GlobalKey<QuestionListViewState>();

  void _onSearchChanged(String query) {
    _questionListViewKey.currentState?.onSearchChanged(query);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchWidget(
            hintText: AppLocalizations.of(context)!.searchForQuestions,
            onSearchChanged: _onSearchChanged,
          ),

          const Gap(15),
          Expanded(child: QuestionListView(key: _questionListViewKey)),
        ],
      ),
    );
  }
}
