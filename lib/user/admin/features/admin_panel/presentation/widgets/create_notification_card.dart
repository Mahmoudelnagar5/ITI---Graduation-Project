import 'package:final_project_iti/core/routing/route_export.dart';

class CreateNotificationCard extends StatelessWidget {
  final AdminController controller;
  const CreateNotificationCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBorder,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create New Q&A Notification',
            style: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.bold),
          ),
          SizedBox(height: 12.h),
          TextField(
            controller: controller.titleController,
            decoration: InputDecoration(
              hintText: 'Enter notification title',
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          TextField(
            controller: controller.messageController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Write your Q&A notification message',
              alignLabelWithHint: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          SendNotificationButton(
            label: 'Send Notification',
            onPressed: () async {
              await SuccessDialog.show(context);
              controller.clear();
            },
          ),
          SizedBox(height: 13.h),
          Center(
            child: Text(
              'This will be sent to all students',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.acountsubtitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
