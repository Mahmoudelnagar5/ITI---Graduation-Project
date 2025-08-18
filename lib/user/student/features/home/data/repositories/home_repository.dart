import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/core/routing/route_export.dart';
import '../models/question_model.dart';
import '../models/track_model.dart';

abstract class HomeRepository {
  Stream<List<TrackModel>> getTracksStream();
  Future<List<TrackModel>> getTracks();
  Stream<List<QuestionModel>> getQuestionsStream();
  Stream<List<QuestionModel>> searchQuestions(String query);
  Stream<List<TrackModel>> searchTracks(String query);
}

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<TrackModel>> getTracksStream() {
    return _firestore
        .collection('Add Track')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return TrackModel.fromFirestore(doc);
          }).toList();
        });
  }

  @override
  Future<List<TrackModel>> getTracks() async {
    final snapshot = await _firestore
        .collection('Add Track')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      return TrackModel.fromFirestore(doc);
    }).toList();
  }

  @override
  Stream<List<QuestionModel>> getQuestionsStream() {
    return _firestore
        .collection('questions')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return QuestionModel.fromFirestore(doc);
          }).toList();
        });
  }

  @override
  Stream<List<QuestionModel>> searchQuestions(String query) {
    if (query.trim().isEmpty) {
      return getQuestionsStream();
    }

    final lowercaseQuery = query.toLowerCase();

    return _firestore
        .collection('questions')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) {
                return QuestionModel.fromFirestore(doc);
              })
              .where((question) {
                return question.title.toLowerCase().contains(lowercaseQuery) ||
                    question.desc.toLowerCase().contains(lowercaseQuery) ||
                    question.answer.toLowerCase().contains(lowercaseQuery);
              })
              .toList();
        });
  }

  @override
  Stream<List<TrackModel>> searchTracks(String query) {
    if (query.trim().isEmpty) {
      return getTracksStream();
    }

    final lowercaseQuery = query.toLowerCase();

    return _firestore
        .collection('Add Track')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) {
                return TrackModel.fromFirestore(doc);
              })
              .where((track) {
                return track.title.toLowerCase().contains(lowercaseQuery) ||
                    track.description.toLowerCase().contains(lowercaseQuery);
              })
              .toList();
        });
  }
}
