import 'package:final_project_iti/core/routing/route_export.dart';

enum ResourceAction { view, download, open }

class ResourceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String meta;
  final String actionLabel;
  final ResourceAction actionType;

  const ResourceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.meta,
    required this.actionLabel,
    required this.actionType,
  });

  IconData _actionIcon() {
    switch (actionType) {
      case ResourceAction.view:
        return Icons.remove_red_eye_outlined;
      case ResourceAction.download:
        return Icons.download_outlined;
      case ResourceAction.open:
        return Icons.launch_outlined;
    }
  }

  Color _actionColor() => AppColors.mainColorStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppTextStyles.cardRadius),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: AppTextStyles.cardShadow,
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // Left column: title + subtitle + meta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.hometusertitle,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.searchIconcolor,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(
                      Icons.picture_as_pdf,
                      size: 16.sp,
                      color: AppColors.hinttextfield,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      meta,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.hinttextfield,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Action button
          SizedBox(width: 14.w),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(_actionIcon(), size: 16, color: Colors.white),
            label: Text(
              actionLabel,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: _actionColor(),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
