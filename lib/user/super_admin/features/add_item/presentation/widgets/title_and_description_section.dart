
import 'package:final_project_iti/core/routing/route_export.dart';

class TitleAndDescriptionSection extends StatelessWidget {
  const TitleAndDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldTitle(title: 'Title'),
        Gap(11.h),
        const AppTextFormField(hintText: 'Enter Title'),
        Gap(24.h),
        const TextFieldTitle(title: 'Description'),
        Gap(11.h),

        const AppTextFormField(hintText: 'Enter description', maxLines: 5),
      ],
    );
  }
}
