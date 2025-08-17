import 'package:final_project_iti/core/routing/route_export.dart';
import '../../../data/repositories/home_repository.dart';

part 'tracks_state.dart';

class TracksCubit extends Cubit<TracksState> {
  final HomeRepository _repository;

  TracksCubit({HomeRepository? repository})
    : _repository = repository ?? HomeRepositoryImpl(),
      super(TracksInitial());

  static TracksCubit of(context) => BlocProvider.of(context);

  // Get tracks once
  Future<void> getTracks() async {
    emit(TracksLoading());

    try {
      final tracks = await _repository.getTracks();

      emit(TracksLoaded(tracks));
    } catch (error) {
      debugPrint('Error getting tracks: $error');
      emit(TracksError(error.toString()));
    }
  }

  // Search tracks by title
  void searchTracks(String query) {
    final currentState = state;
    if (currentState is TracksLoaded) {
      if (query.trim().isEmpty) {
        // If search is empty, reload tracks
        getTracks();
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
}
