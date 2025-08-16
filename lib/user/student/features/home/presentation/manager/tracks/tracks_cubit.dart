import 'package:final_project_iti/core/routing/route_export.dart';
import '../../../data/repositories/tracks_repository.dart';

part 'tracks_state.dart';

class TracksCubit extends Cubit<TracksState> {
  final TracksRepository _repository;

  TracksCubit({TracksRepository? repository})
    : _repository = repository ?? TracksRepositoryImpl(),
      super(TracksInitial());

  static TracksCubit of(context) => BlocProvider.of(context);

  // Stream tracks from Firestore (real-time updates)
  void streamTracks() {
    emit(TracksLoading());

    _repository.getTracksStream().listen(
      (tracks) {
        emit(TracksLoaded(tracks));
      },
      onError: (error) {
        debugPrint('Error streaming tracks: $error');
        emit(TracksError(error.toString()));
      },
    );
  }

  // Search tracks by title
  void searchTracks(String query) {
    final currentState = state;
    if (currentState is TracksLoaded) {
      if (query.trim().isEmpty) {
        // If search is empty, restart stream to get all tracks
        streamTracks();
      } else {
        final filteredTracks = currentState.tracks
            .where(
              (track) =>
                  track.title.toLowerCase().contains(query.toLowerCase()) ||
                  track.description.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
        emit(TracksLoaded(filteredTracks));
      }
    }
  }

  // Get track by ID
  TrackModel? getTrackById(String id) {
    final currentState = state;
    if (currentState is TracksLoaded) {
      try {
        return currentState.tracks.firstWhere((track) => track.id == id);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
