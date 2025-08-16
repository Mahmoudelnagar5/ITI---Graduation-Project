import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/core/routing/route_export.dart';

abstract class AddItemRepo {
  Future<void> addItem({
    required String collectionName,
    required String title,
    required String description,
    required List<String> contents,
  });
}

class AddItemRepoImpl implements AddItemRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addItem({
    required String collectionName,
    required String title,
    required String description,
    required List<String> contents,
  }) async {
    try {
      await _firestore.collection(collectionName).add({
        'title': title,
        'description': description,
        'contents': contents,
        'image': Assets.imagesFlutter, // Default image
        'createdAt': FieldValue.serverTimestamp(),
      });
      debugPrint("Track added successfully");
    } catch (e) {
      debugPrint("Error adding track: $e");
      throw Exception("Failed to add track: $e");
    }
  }
}
