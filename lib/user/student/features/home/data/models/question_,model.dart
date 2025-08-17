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

  // Convert to JSON for cache storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'answer': answer,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  // Create from JSON for cache retrieval
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      answer: json['answer'],
      createdAt: Timestamp.fromMillisecondsSinceEpoch(json['createdAt']),
    );
  }
}
