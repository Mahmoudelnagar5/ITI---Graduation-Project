import '../../../../../../core/routing/route_export.dart';
import 'active_track_item.dart';
import 'package:final_project_iti/user/student/features/home/data/repositories/home_repository.dart';

class GirdViewActiveTrackItem extends StatelessWidget {
  const GirdViewActiveTrackItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TrackModel>>(
      stream: HomeRepositoryImpl().getTracksStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: AppTextStyles.textStyleRegular16.copyWith(
                color: Colors.red,
              ),
            ),
          );
        }
        final tracks = snapshot.data ?? [];
        if (tracks.isEmpty) {
          return Center(
            child: Text(
              'No active tracks',
              style: AppTextStyles.textStyleRegular16.copyWith(
                color: AppColors.lightHintTextField,
              ),
            ),
          );
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: .9,
          ),
          itemCount: tracks.length,
          itemBuilder: (context, index) =>
              ActiveTrackItem(track: tracks[index]),
        );
      },
    );
  }
}
