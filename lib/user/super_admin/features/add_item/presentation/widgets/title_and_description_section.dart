import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/controller/track_cubit/add_item_cubit.dart';

class TitleAndDescriptionSection extends StatelessWidget {
  const TitleAndDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AddItemCubit.of(context);
    return Column(
      children: [
        const TextFieldTitle(title: 'Title'),
        Gap(11.h),
        AppTextFormField(
          controller: cubit.titleController,
          hintText: 'Enter Title',
        ),
        Gap(24.h),
        const TextFieldTitle(title: 'Description'),
        Gap(11.h),
        AppTextFormField(
          controller: cubit.descriptionController,
          hintText: 'Enter description',
          maxLines: 5,
        ),
      ],
    );
  }
}
