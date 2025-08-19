part of 'chat_ai_cubit.dart';

sealed class ChatAiState extends Equatable {
  const ChatAiState();

  List<MessageModel> get messages => [];

  @override
  List<Object> get props => [];
}

final class ChatAiInitial extends ChatAiState {
  @override
  final List<MessageModel> messages;

  const ChatAiInitial({this.messages = const []});

  @override
  List<Object> get props => [messages];
}

final class ChatAiLoading extends ChatAiState {
  @override
  final List<MessageModel> messages;

  const ChatAiLoading({required this.messages});

  @override
  List<Object> get props => [messages];
}

final class ChatAiSuccess extends ChatAiState {
  @override
  final List<MessageModel> messages;

  const ChatAiSuccess({required this.messages});

  @override
  List<Object> get props => [messages];
}

final class ChatAiError extends ChatAiState {
  final String error;
  @override
  final List<MessageModel> messages;

  const ChatAiError(this.error, {required this.messages});

  @override
  List<Object> get props => [error, messages];
}
