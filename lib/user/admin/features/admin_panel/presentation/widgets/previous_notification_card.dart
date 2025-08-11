import 'package:final_project_iti/core/routing/route_export.dart';

class PreviousNotificationCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String description;

  const PreviousNotificationCard({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.cardBorder,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                dateTime,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.acountsubtitle,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            description,
            style: TextStyle(fontSize: 14.sp, color: AppColors.lightGrey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
