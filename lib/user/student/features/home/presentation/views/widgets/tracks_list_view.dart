import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/presentation/manager/tracks/tracks_cubit.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/widgets/track_item.dart';

class TracksListView extends StatelessWidget {
  const TracksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TracksCubit, TracksState>(
      builder: (context, state) {
        if (state is TracksLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TracksError) {
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
                  state.message,
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

        if (state is TracksLoaded) {
          if (state.tracks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 64.r,
                    color: AppColors.lightHintTextField,
                  ),
                  Gap(16.h),
                  Text(
                    'No tracks available',
                    style: AppTextStyles.textStyleMedium14.copyWith(
                      color: AppColors.lightHintTextField,
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    'No tracks have been added yet.\nCheck back later or contact admin.',
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
            itemCount: state.tracks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: TrackItem(trackModel: state.tracks[index]),
              );
            },
          );
        }

        // Initial state
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
