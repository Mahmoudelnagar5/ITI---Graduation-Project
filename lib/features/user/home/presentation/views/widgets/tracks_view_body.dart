import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/l10n/app_localizations.dart';

import 'tracks_list_view.dart';

class TrackViewBody extends StatefulWidget {
  const TrackViewBody({super.key});

  @override
  State<TrackViewBody> createState() => _TrackViewBodyState();
}

class _TrackViewBodyState extends State<TrackViewBody> {
  Function(String)? _onSearchChanged;

  void _setSearchCallback(Function(String) callback) {
    _onSearchChanged = callback;
  }

  void _handleSearchChanged(String query) {
    _onSearchChanged?.call(query);
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
            onSearchChanged: _handleSearchChanged,
          ),
          const Gap(24),
          Expanded(child: TracksListView(onSearchCallback: _setSearchCallback)),
        ],
      ),
    );
  }
}
