import 'package:equatable/equatable.dart';
import 'package:final_project_iti/user/student/features/home/data/models/question_model.dart';

abstract class StarredQuestionsState extends Equatable {
  const StarredQuestionsState();

  @override
  List<Object?> get props => [];
}

class StarredQuestionsInitial extends StarredQuestionsState {}

class StarredQuestionsLoading extends StarredQuestionsState {}

class StarredQuestionsLoaded extends StarredQuestionsState {
  final List<QuestionModel> starredQuestions;

  const StarredQuestionsLoaded({required this.starredQuestions});

  @override
  List<Object?> get props => [starredQuestions];
}

class StarredQuestionsEmpty extends StarredQuestionsState {}

class StarredQuestionsError extends StarredQuestionsState {
  final String message;

  const StarredQuestionsError({required this.message});

  @override
  List<Object?> get props => [message];
}

class QuestionStarred extends StarredQuestionsState {
  final String questionId;
  final bool isStarred;

  const QuestionStarred({required this.questionId, required this.isStarred});

  @override
  List<Object?> get props => [questionId, isStarred];
}
