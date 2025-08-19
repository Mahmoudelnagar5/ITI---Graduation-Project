import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/core/routing/route_export.dart';

class TrackModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final List<String> contents;
  final DateTime? createdAt;

  TrackModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    this.contents = const [],
    this.createdAt,
  });

  // Constructor from Firestore document
  factory TrackModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TrackModel(
      id: doc.id,
      title: data['title'] ?? '',
      image: data['image'] ?? Assets.imagesFlutter, // Default image
      description: data['description'] ?? '',
      contents: List<String>.from(data['contents'] ?? []),
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // Convert to Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'contents': contents,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }

  // Convert to Map for AI context (without Timestamp)
  Map<String, dynamic> toAIContext() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'contents': contents,
      'createdAt': createdAt?.toString() ?? 'Unknown',
    };
  }
}
