part of 'tracks_cubit.dart';

@immutable
sealed class TracksState {}

class TracksInitial extends TracksState {}

class TracksLoading extends TracksState {}

class TracksLoaded extends TracksState {
  final List<TrackModel> tracks;
  TracksLoaded(this.tracks);
}

class TracksError extends TracksState {
  final String message;
  TracksError(this.message);
}
