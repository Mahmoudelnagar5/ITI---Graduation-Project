import 'package:final_project_iti/core/routing/route_export.dart';

import '../controller/admin_cubit/admin_cubit.dart';

class CreateNotificationCard extends StatelessWidget {
  final AdminController controller;
  const CreateNotificationCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Question added successfully!',
                    style: AppTextStyles.textStyleMedium14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.green,
            ),
          );
          controller.clear();
        } else if (state is AdminFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
        }
      },
      builder: (context, state) {
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
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              AppTextFormField(
                controller: controller.titleController,
                hintText: 'Enter your question',
              ),
              Gap(25.h),
              AppTextFormField(
                controller: controller.messageController,
                hintText: 'Enter description of your question',
                maxLines: 2,
              ),
              Gap(11.h),
              AppTextFormField(
                controller: controller.instituteAnswerController,
                hintText: 'Enter Institute Answer',
                maxLines: 4,
              ),

              Gap(16.h),
              SendNotificationButton(
                label: state is AdminLoading ? 'Saving...' : 'Save Changes',
                onPressed: state is AdminLoading
                    ? null
                    : () {
                        AdminCubit.get(context).addQuestion(
                          controller.titleController.text,
                          controller.messageController.text,
                          controller.instituteAnswerController.text,
                        );
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
      },
    );
  }
}
