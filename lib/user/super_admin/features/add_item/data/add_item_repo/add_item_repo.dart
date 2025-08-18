import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/core/routing/route_export.dart';

abstract class AddItemRepo {
  Future<void> addItem({
    required String collectionName,
    required String title,
    required String description,
    required List<String> contents,
  });

  Future<void> updateItem({
    required String collectionName,
    required String id,
    required String title,
    required String description,
    required List<String> contents,
  });

  Future<void> deleteItem({required String collectionName, required String id});
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

  @override
  Future<void> updateItem({
    required String collectionName,
    required String id,
    required String title,
    required String description,
    required List<String> contents,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(id).update({
        'title': title,
        'description': description,
        'contents': contents,
        'image': Assets.imagesFlutter,
        // don't overwrite createdAt
      });
      debugPrint("Track updated successfully");
    } catch (e) {
      debugPrint("Error updating track: $e");
      throw Exception("Failed to update track: $e");
    }
  }

  @override
  Future<void> deleteItem({
    required String collectionName,
    required String id,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(id).delete();
      debugPrint("Track deleted successfully");
    } catch (e) {
      debugPrint("Error deleting track: $e");
      throw Exception("Failed to delete track: $e");
    }
  }
}
