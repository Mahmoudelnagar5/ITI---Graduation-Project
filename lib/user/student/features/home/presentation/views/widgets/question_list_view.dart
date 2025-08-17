import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/data/models/question_,model.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/tracks_repository.dart';
import 'question_item.dart';

class QuestionListView extends StatelessWidget {
  const QuestionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuestionModel>>(
      stream: HomeRepositoryImpl().getQuestionsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64.r,
                  color: AppColors.lightHintTextField,
                ),
                Gap(16.h),
                Text(
                  'Error loading questions',
                  style: AppTextStyles.textStyleMedium14.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                ),
                Gap(8.h),
                Text(
                  snapshot.error.toString(),
                  style: AppTextStyles.textStyleRegular12.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(16.h),
              ],
            ),
          );
        }

        final questions = snapshot.data ?? [];
        debugPrint(questions.length.toString());

        return ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: QuestionItem(questionModel: questions[index]),
            );
          },
        );
      },
    );
  }
}
