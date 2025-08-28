import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/presentation/widgets/track_item.dart';

class TracksListView extends StatefulWidget {
  const TracksListView({super.key});

  @override
  State<TracksListView> createState() => TracksListViewState();
}

class TracksListViewState extends State<TracksListView> {
  String _searchQuery = '';
  final HomeRepositoryImpl _repository = HomeRepositoryImpl();

  void onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TrackModel>>(
      stream: _repository.searchTracks(_searchQuery),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64.r,
                  color: AppColors.lightHintTextField,
                ),
                Gap(16.h),
                Text(
                  'Error loading tracks',
                  style: AppTextStyles.textStyleMedium14.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                ),
                Gap(8.h),
                Text(
                  snapshot.error.toString(),
                  style: AppTextStyles.textStyleRegular12.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(16.h),
              ],
            ),
          );
        }

        final tracks = snapshot.data ?? [];

        if (tracks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _searchQuery.trim().isEmpty
                      ? Icons.inbox_outlined
                      : Icons.search_off,
                  size: 64.r,
                  color: AppColors.lightHintTextField,
                ),
                Gap(16.h),
                Text(
                  _searchQuery.trim().isEmpty
                      ? 'No tracks available'
                      : 'No tracks found',
                  style: AppTextStyles.textStyleMedium14.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                ),
                Gap(8.h),
                Text(
                  _searchQuery.trim().isEmpty
                      ? 'No tracks have been added yet.\nCheck back later or contact admin.'
                      : 'Try searching with different keywords',
                  style: AppTextStyles.textStyleRegular12.copyWith(
                    color: AppColors.lightHintTextField,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: TrackItem(trackModel: tracks[index]),
            );
          },
        );
      },
    );
  }
}
