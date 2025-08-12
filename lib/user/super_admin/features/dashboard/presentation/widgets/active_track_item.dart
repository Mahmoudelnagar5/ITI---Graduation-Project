import '../../../../../../core/routing/route_export.dart';

class ActiveTrackItem extends StatelessWidget {
  const ActiveTrackItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width: 140.w,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.track_changes,
                  color: AppColors.mainColorStart,
                  size: 28.r,
                ),
                const Spacer(),
                Image.asset(Assets.imagesEditIcon, scale: .82.r),
                const Gap(4),
                Icon(
                  Icons.delete,
                  color: AppColors.searchIconcolor,
                  size: 25.r,
                ),
              ],
            ),

            const Gap(16),

            Text(
              'Mobile Dev',
              style: AppTextStyles.textStyleMedium16.copyWith(
                color: AppColors.hometusertitle,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(12),
            Text(
              '45 Students',
              style: AppTextStyles.textStyleRegular14.copyWith(
                color: AppColors.searchIconcolor,
              ),
            ),
            const Gap(4),
            Text(
              '3 Courses',
              style: AppTextStyles.textStyleRegular14.copyWith(
                color: AppColors.searchIconcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
