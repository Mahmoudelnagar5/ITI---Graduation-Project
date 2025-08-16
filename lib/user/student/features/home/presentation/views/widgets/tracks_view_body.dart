import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/l10n/app_localizations.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/tracks/tracks_cubit.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/search_widget.dart';

import '../../../data/repositories/tracks_repository.dart';
import 'tracks_list_view.dart';

class TrackViewBody extends StatelessWidget {
  const TrackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TracksCubit(repository: TracksRepositoryImpl()),
      child: const _TrackViewBodyContent(),
    );
  }
}

class _TrackViewBodyContent extends StatefulWidget {
  const _TrackViewBodyContent();

  @override
  State<_TrackViewBodyContent> createState() => _TrackViewBodyContentState();
}

class _TrackViewBodyContentState extends State<_TrackViewBodyContent> {
  @override
  void initState() {
    super.initState();
    // Start streaming tracks when widget initializes
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    TracksCubit.of(context).streamTracks();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(12.h),
          SearchWidget(hintText: AppLocalizations.of(context)!.searchTracks),
          const Gap(24),
          const Expanded(child: TracksListView()),
        ],
      ),
    );
  }
}
