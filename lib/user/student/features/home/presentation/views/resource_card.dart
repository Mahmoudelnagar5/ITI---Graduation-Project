// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/data/functions/functions.dart';

enum ResourceAction { view, download, open }

class ResourceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String meta;
  final String actionLabel;
  final String type;
  final ResourceAction actionType;
  final String urlPath;

  const ResourceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.meta,
    required this.actionLabel,
    required this.type,
    required this.actionType,
    required this.urlPath,
  });

  IconData _actionIcon(type) {
    switch (type) {
      case "Article (Link)":
        return Icons.remove_red_eye_outlined;
      default:
        return Icons.launch_outlined;
    }
  }

  Color _actionColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppTextStyles.cardRadius),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
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
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(
                      type == "Article (Link)"
                          ? Icons.picture_as_pdf
                          : Icons.video_library_outlined,
                      size: 16.sp,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      meta,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
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
            onPressed: () {
              type != "Article (Link)"
                  ? openYoutubeVideo(urlPath)
                  : openAnyLink(urlPath);
            },
            icon: Icon(_actionIcon(type), size: 16, color: Colors.white),
            label: Text(
              actionLabel,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: _actionColor(context),
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
