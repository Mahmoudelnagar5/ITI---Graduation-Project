import '../../../../../../core/routing/route_export.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/data/add_item_repo/add_item_repo.dart';

class ActiveTrackItem extends StatelessWidget {
  const ActiveTrackItem({super.key, required this.track});

  final TrackModel track;

  Future<void> _confirmDelete(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);

    final ok = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => AlertDialog(
        title: Text(
          'Delete Track',
          style: AppTextStyles.textStyleMedium16.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${track.title}"?',
          style: AppTextStyles.textStyleRegular14,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(false),
            child: Text(
              'Cancel',
              style: AppTextStyles.textStyleMedium14.copyWith(
                color: AppColors.lightHintTextField,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(true),
            child: Text(
              'Delete',
              style: AppTextStyles.textStyleMedium14.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );

    if (ok == true) {
      try {
        await AddItemRepoImpl().deleteItem(
          collectionName: 'Add Track',
          id: track.id,
        );
        messenger.showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Track deleted',
              style: AppTextStyles.textStyleMedium14.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
      } catch (e) {
        messenger.showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Failed to delete: $e',
              style: AppTextStyles.textStyleMedium14.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    }
  }

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
                InkWell(
                  onTap: () {
                    AppNavigation.pushName(
                      context: context,
                      route: AppRoutes.addItemView,
                      argument: {'title': 'Edit Track', 'track': track},
                    );
                  },
                  child: Image.asset(Assets.imagesEditIcon, scale: .82.r),
                ),
                const Gap(4),
                InkWell(
                  onTap: () => _confirmDelete(context),
                  child: Icon(
                    Icons.delete,
                    color: AppColors.searchIconcolor,
                    size: 25.r,
                  ),
                ),
              ],
            ),

            const Gap(16),

            Text(
              track.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textStyleMedium16.copyWith(
                color: AppColors.hometusertitle,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(8),
            Text(
              track.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textStyleRegular14.copyWith(
                color: AppColors.searchIconcolor,
              ),
            ),
            const Gap(8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${track.contents.length} Items',
                style: AppTextStyles.textStyleRegular14.copyWith(
                  color: AppColors.searchIconcolor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
