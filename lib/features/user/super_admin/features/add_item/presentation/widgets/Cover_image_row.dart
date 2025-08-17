
import 'package:dotted_border/dotted_border.dart';
import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/Cover_image_botton.dart';

class CoverImageRow extends StatelessWidget {
  const CoverImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            dashPattern: [10, 5],
            strokeWidth: 2,
            padding: const EdgeInsets.all(16),
            radius: Radius.circular(8.r),
            color: AppColors.lightHintTextField,
          ),
          child: SizedBox(
            height: 120.r,
            width: 120.r,
            child: Padding(
              padding: EdgeInsetsGeometry.all(35.r),
              child: SvgPicture.asset(
                Assets.imagesImageLogo,
                height: 32.r,
                width: 32.r,
              ),
            ),
          ),
        ),
        Gap(16.w),
        const CoverImageBotton(),
      ],
    );
  }
}
