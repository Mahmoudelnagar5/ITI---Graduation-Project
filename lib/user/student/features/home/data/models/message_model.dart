import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;

  const MessageModel({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });

  @override
  List<Object> get props => [id, text, isUser, timestamp];
}
