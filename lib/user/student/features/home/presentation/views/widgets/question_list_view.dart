import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/data/models/question_,model.dart';

import '../../../data/repositories/tracks_repository.dart';
import 'question_item.dart';

class QuestionListView extends StatefulWidget {
  const QuestionListView({super.key});

  @override
  State<QuestionListView> createState() => QuestionListViewState();
}

class QuestionListViewState extends State<QuestionListView> {
  String _searchQuery = '';
  final HomeRepositoryImpl _repository = HomeRepositoryImpl();

  void onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuestionModel>>(
      stream: _repository.searchQuestions(_searchQuery),
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

        if (questions.isEmpty && _searchQuery.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off,
                  size: 64.r,
                  color: AppColors.lightHintTextField,
                ),
                Gap(16.h),
                Text(
                  'No questions found',
                  style: AppTextStyles.textStyleMedium14.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                ),
                Gap(8.h),
                Text(
                  'Try searching with different keywords',
                  style: AppTextStyles.textStyleRegular12.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

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
