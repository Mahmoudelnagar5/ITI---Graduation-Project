import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/core/routing/route_export.dart';
import '../models/track_model.dart';

abstract class TracksRepository {
  Stream<List<TrackModel>> getTracksStream();
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
}
