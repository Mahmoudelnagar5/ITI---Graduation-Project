import '../../../../../../core/routing/route_export.dart';
import 'girdview_active_track_item.dart';
import 'list_view_items_info.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListViewItemsInfo(),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Active Tracks',
                  style: AppTextStyles.textStyleSemiBold18.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: AppTextStyles.textStyleMedium14.copyWith(
                      color: AppColors.mainColorStart,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
            const GirdViewActiveTrackItem(),
          ],
        ),
      ),
    );
  }
}
