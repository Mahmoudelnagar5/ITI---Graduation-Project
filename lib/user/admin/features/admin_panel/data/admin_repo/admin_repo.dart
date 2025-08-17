import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/core/routing/route_export.dart';

abstract class AdminRepo {
  Future<void> addQuestion({
    required String title,
    required String desc,
    required String answer,
  });
}

class AdminRepoImpl implements AdminRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addQuestion({
    required String title,
    required String desc,
    required String answer,
  }) async {
    try {
      await _firestore.collection('questions').add({
        'title': title,
        'desc': desc,
        'answer': answer,
        'createdAt': FieldValue.serverTimestamp(),
      });
      debugPrint("Question added successfully");
    } catch (e) {
      debugPrint("Error adding question: $e");
      throw Exception("Failed to add question: $e");
    }
  }
}
