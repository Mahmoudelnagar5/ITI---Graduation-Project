
import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/Cover_image_row.dart';

class CoverImageSection extends StatelessWidget {
  const CoverImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Image Cover',
            style: AppTextStyles.textStyleMedium14.copyWith(
              fontFamily: AppFontFamily.inter,
            ),
          ),
        ),
        Gap(11.h),
        const CoverImageRow(),
      ],
    );
  }
}
