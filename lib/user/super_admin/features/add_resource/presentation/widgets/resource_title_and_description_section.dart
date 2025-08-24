import 'package:final_project_iti/core/routing/route_export.dart';

class ResourceTitleAndDescriptionSection extends StatelessWidget {
  const ResourceTitleAndDescriptionSection({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldTitle(title: 'Title'),
        Gap(11.h),
        AppTextFormField(controller: titleController, hintText: 'Enter Title'),
        Gap(24.h),
        const TextFieldTitle(title: 'Description'),
        Gap(11.h),
        AppTextFormField(
          controller: descriptionController,
          hintText: 'Enter description',
          maxLines: 5,
        ),
      ],
    );
  }
}
