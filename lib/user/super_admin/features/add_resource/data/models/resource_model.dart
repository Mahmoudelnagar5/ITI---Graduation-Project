import 'package:cloud_firestore/cloud_firestore.dart';

class ResourceModel {
  final String id;
  final String title;
  final String description;
  final String type; // pdf, youtube, link
  final String url; // link to file or video or article
  final String? track; // Mobile, Web, AI, ...
  final DateTime createdAt;

  ResourceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.url,
    this.track,
    required this.createdAt,
  });

  // Convert to Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'url': url,
      'track': track,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  // Construct from Firestore document
  factory ResourceModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ResourceModel(
      id: data['id'] ?? doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      type: data['type'] ?? '',
      url: data['url'] ?? '',
      track: data['track'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}
