import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project_iti/core/helper/services/starred_questions_service.dart';
import 'package:final_project_iti/user/student/features/home/data/models/question_model.dart';
import 'starred_questions_state.dart';

class StarredQuestionsCubit extends Cubit<StarredQuestionsState> {
  final StarredQuestionsService _starredService = StarredQuestionsService();

  StarredQuestionsCubit() : super(StarredQuestionsInitial());

  // Load all starred questions
  Future<void> loadStarredQuestions() async {
    emit(StarredQuestionsLoading());

    try {
      final List<QuestionModel> starredQuestions = _starredService
          .getStarredQuestions();

      if (starredQuestions.isEmpty) {
        emit(StarredQuestionsEmpty());
      } else {
        emit(StarredQuestionsLoaded(starredQuestions: starredQuestions));
      }
    } catch (e) {
      emit(StarredQuestionsError(message: e.toString()));
    }
  }

  // Add question to starred
  Future<void> addStarredQuestion(QuestionModel question) async {
    try {
      final success = await _starredService.addStarredQuestion(question);

      if (success) {
        emit(QuestionStarred(questionId: question.id, isStarred: true));

        // Reload the list to reflect changes
        await loadStarredQuestions();
      }
    } catch (e) {
      emit(StarredQuestionsError(message: e.toString()));
    }
  }

  // Remove question from starred
  Future<void> removeStarredQuestion(String questionId) async {
    try {
      final success = await _starredService.removeStarredQuestion(questionId);

      if (success) {
        emit(QuestionStarred(questionId: questionId, isStarred: false));

        // Reload the list to reflect changes
        await loadStarredQuestions();
      }
    } catch (e) {
      emit(StarredQuestionsError(message: e.toString()));
    }
  }

  // Toggle question starred status
  Future<void> toggleStarredQuestion(QuestionModel question) async {
    try {
      final isCurrentlyStarred = _starredService.isQuestionStarred(question.id);

      if (isCurrentlyStarred) {
        await removeStarredQuestion(question.id);
      } else {
        await addStarredQuestion(question);
      }
    } catch (e) {
      emit(StarredQuestionsError(message: e.toString()));
    }
  }

  // Check if question is starred67
  bool isQuestionStarred(String questionId) {
    return _starredService.isQuestionStarred(questionId);
  }

  // Clear all starred questions
  Future<void> clearStarredQuestions() async {
    try {
      final success = await _starredService.clearStarredQuestions();

      if (success) {
        emit(StarredQuestionsEmpty());
      }
    } catch (e) {
      emit(StarredQuestionsError(message: e.toString()));
    }
  }

  // Get current starred questions count
  int getStarredQuestionsCount() {
    return _starredService.getStarredQuestions().length;
  }
}
