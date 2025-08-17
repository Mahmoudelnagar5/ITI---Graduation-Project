import 'package:final_project_iti/core/routing/route_export.dart';

class NotificationBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // For full height if needed
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        bool sendNotification = false;
        final titleController = TextEditingController();
        final messageController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Changes Saved",
                        style: AppTextStyles.textStyleMedium18.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Your changes have been saved successfully.",
                    style: AppTextStyles.textStyleRegular16.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Gap(16.h),

                  // Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: sendNotification,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            sendNotification = value ?? false;
                          });
                        },
                      ),
                      Text(
                        "Send notification to users",
                        style: AppTextStyles.textStyleMedium14.copyWith(
                          // fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),

                  // Title field
                  if (sendNotification) ...[
                    const Gap(8),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Enter title',
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
                      controller: messageController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Enter message',
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

                    const Gap(16),
                    SendNotificationButton(
                      label: 'Send Notification',
                      onPressed: () {
                        SuccessDialog.show(context);
                      },
                    ),
                  ],
                  Gap(16.h),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
