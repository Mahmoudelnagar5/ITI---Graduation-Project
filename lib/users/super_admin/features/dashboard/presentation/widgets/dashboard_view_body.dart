import '../../../../../../core/routing/route_export.dart';
import 'girdview_active_track_item.dart';
import 'list_view_items_info.dart';
import 'quick_action_item.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Gap(12),
            Text(
              'Quick Actions',
              style: AppTextStyles.textStyleSemiBold18.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(16),
            const Row(
              children: [
                QuickActionItem(
                  color: AppColors.mainColorStart,
                  text: 'Add Track',
                  icon: Icons.add,
                ),
                Gap(16),
                QuickActionItem(
                  text: 'Manage Rounds',
                  icon: Icons.school_rounded,
                ),
              ],
            ),
            const Gap(16),
            const Row(
              children: [
                QuickActionItem(text: 'Add Courses', icon: Icons.book),
                Gap(16),
                QuickActionItem(text: 'Manage Resources', icon: Icons.book),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
