import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final String id;
  final String title;
  final String desc;
  final String answer;
  final Timestamp createdAt;

  QuestionModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.answer,
    required this.createdAt,
  });
  factory QuestionModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return QuestionModel(
      id: doc.id,
      title: data['title'],
      desc: data['desc'],
      answer: data['answer'],
      createdAt: data['createdAt'],
    );
  }
}
