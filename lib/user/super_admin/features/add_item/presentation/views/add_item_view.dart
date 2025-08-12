import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/Cover_image_section.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/add_item_app_bar.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/title_and_description_section.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddItemAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              const TitleAndDescriptionSection(),
              Gap(34.h),
              const CoverImageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
