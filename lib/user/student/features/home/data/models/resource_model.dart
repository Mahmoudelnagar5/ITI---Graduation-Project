// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ResourceModel {
  final String id;
  final String title;
  final String description;
  final String type;
  final String track;
  final String? url;
  final DateTime? createdAt;

  ResourceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.track,
    this.url,
    this.createdAt,
  });

  // Constructor from Firestore document
  factory ResourceModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ResourceModel(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
      type: '${data['type'] ?? 'unknown'}',
      track: '${data['track'] ?? 'general'}',
      url: '${data['url'] ?? ''}',
    );
  }

  // Convert to Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
      'url': url ?? '',
      'type': type,
      'track': track,
      'id': id,
    };
  }
}
