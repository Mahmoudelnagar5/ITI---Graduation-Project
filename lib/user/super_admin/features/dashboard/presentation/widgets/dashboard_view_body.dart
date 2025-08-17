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
            Row(
              children: [
                Expanded(
                  child: QuickActionItem(
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.addItemView,
                        argument: 'Add Track',
                      );
                    },
                    color: AppColors.mainColorStart,
                    text: 'Add Track',
                    icon: Icon(Icons.add, color: AppColors.white, size: 30.r),
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: QuickActionItem(
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.addItemView,
                        argument: 'Manage Rounds',
                      );
                    },
                    text: 'Manage Rounds',
                    icon: Image.asset(
                      Assets.imagesTracklogo,
                      color: AppColors.hometusersubtitle,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: QuickActionItem(
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.addItemView,
                        argument: 'Add Courses',
                      );
                    },
                    text: 'Add Courses',
                    icon: Image.asset(
                      Assets.imagesBook,
                      color: AppColors.hometusersubtitle,
                    ),
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: QuickActionItem(
                    onTap: () {
                      AppNavigation.pushName(
                        context: context,
                        route: AppRoutes.addResourceView,
                        argument: 'Manage Resources',
                      );
                    },
                    text: 'Manage Resources',
                    icon: Image.asset(
                      Assets.imagesBook,
                      color: AppColors.hometusersubtitle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
