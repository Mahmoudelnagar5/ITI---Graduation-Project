import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/core/routing/route_export.dart';
import '../models/track_model.dart';

abstract class TracksRepository {
  Stream<List<TrackModel>> getTracksStream();
  Future<List<TrackModel>> getTracks();
}

class TracksRepositoryImpl implements TracksRepository {
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
}
