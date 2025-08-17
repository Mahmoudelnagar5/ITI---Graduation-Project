import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final String title;
  final String desc;
  final String answer;
  final Timestamp createdAt;

  QuestionModel({
    required this.title,
    required this.desc,
    required this.answer,
    required this.createdAt,
  });
  factory QuestionModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return QuestionModel(
      title: data['title'],
      desc: data['desc'],
      answer: data['answer'],
      createdAt: data['createdAt'],
    );
  }
}
