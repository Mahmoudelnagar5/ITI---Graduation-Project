import 'package:final_project_iti/core/routing/route_export.dart';

import 'tracks_list_view.dart';

class TrackViewBody extends StatefulWidget {
  const TrackViewBody({super.key});

  @override
  State<TrackViewBody> createState() => _TrackViewBodyState();
}

class _TrackViewBodyState extends State<TrackViewBody> {
  final GlobalKey<TracksListViewState> _tracksListViewKey =
      GlobalKey<TracksListViewState>();

  void _onSearchChanged(String query) {
    _tracksListViewKey.currentState?.onSearchChanged(query);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(12.h),
          SearchWidget(
            hintText: AppLocalizations.of(context)!.searchTracks,
            onSearchChanged: _onSearchChanged,
          ),
          const Gap(24),
          Expanded(child: TracksListView(key: _tracksListViewKey)),
        ],
      ),
    );
  }
}
