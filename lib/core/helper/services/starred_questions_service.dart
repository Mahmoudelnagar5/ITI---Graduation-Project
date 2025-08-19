import 'dart:convert';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper_keys.dart';
import 'package:final_project_iti/user/student/features/home/data/models/question_model.dart';

class StarredQuestionsService {
  static final StarredQuestionsService _instance =
      StarredQuestionsService._internal();
  factory StarredQuestionsService() => _instance;
  StarredQuestionsService._internal();

  final CacheHelper _cacheHelper = CacheHelper();

  // Get all starred questions
  List<QuestionModel> getStarredQuestions() {
    try {
      final String? starredQuestionsJson = _cacheHelper.getData(
        key: CasheKeys.starredQuestions,
      );
      if (starredQuestionsJson == null || starredQuestionsJson.isEmpty) {
        return [];
      }

      final List<dynamic> questionsList = json.decode(starredQuestionsJson);
      return questionsList.map((json) => QuestionModel.fromJson(json)).toList();
    } catch (e) {
      print('Error getting starred questions: $e');
      return [];
    }
  }

  // Add question to starred
  Future<bool> addStarredQuestion(QuestionModel question) async {
    try {
      final List<QuestionModel> starredQuestions = getStarredQuestions();

      // Check if question already exists
      if (starredQuestions.any((q) => q.id == question.id)) {
        return true; // Already starred
      }

      starredQuestions.add(question);
      final String jsonString = json.encode(
        starredQuestions.map((q) => q.toJson()).toList(),
      );

      return await _cacheHelper.saveData(
        key: CasheKeys.starredQuestions,
        value: jsonString,
      );
    } catch (e) {
      print('Error adding starred question: $e');
      return false;
    }
  }

  // Remove question from starred
  Future<bool> removeStarredQuestion(String questionId) async {
    try {
      final List<QuestionModel> starredQuestions = getStarredQuestions();
      starredQuestions.removeWhere((q) => q.id == questionId);

      final String jsonString = json.encode(
        starredQuestions.map((q) => q.toJson()).toList(),
      );

      return await _cacheHelper.saveData(
        key: CasheKeys.starredQuestions,
        value: jsonString,
      );
    } catch (e) {
      print('Error removing starred question: $e');
      return false;
    }
  }

  // Check if question is starred
  bool isQuestionStarred(String questionId) {
    final List<QuestionModel> starredQuestions = getStarredQuestions();
    return starredQuestions.any((q) => q.id == questionId);
  }

  // Clear all starred questions
  Future<bool> clearStarredQuestions() async {
    try {
      return await _cacheHelper.removeData(key: CasheKeys.starredQuestions);
    } catch (e) {
      print('Error clearing starred questions: $e');
      return false;
    }
  }
}
