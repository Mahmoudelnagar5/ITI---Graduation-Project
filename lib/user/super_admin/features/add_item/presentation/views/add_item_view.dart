import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/Cover_image_section.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/add_item_app_bar.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/title_and_description_section.dart';

import '../widgets/add_item_button.dart';
import '../widgets/curriculum_item_list_view.dart';
import '../widgets/notification_bottom_sheet.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AddItemAppBar(title: title),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleAndDescriptionSection(),
              Gap(34.h),
              const CoverImageSection(),
              const Gap(28),
              Text(
                'Curriculum Items',
                style: AppTextStyles.textStyleMedium14.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 16.sp,
                ),
              ),
              Gap(16.h),
              const CurriculumItemListView(),
              const AddItemButton(),
              Gap(16.h),
              SendNotificationButton(
                label: 'Save Changes',
                onPressed: () {
                  NotificationBottomSheet.show(context);
                },
              ),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
