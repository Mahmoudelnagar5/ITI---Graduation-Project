
import 'package:final_project_iti/core/routing/route_export.dart';

class CoverImageBotton extends StatelessWidget {
  const CoverImageBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 38,
        width: 128.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.mainColorStart, width: 1.5),
        ),
        child: Center(
          child: Text(
            'Choose Image',
            style: AppTextStyles.textStyleMedium14.copyWith(
              fontFamily: AppFontFamily.inter,
              color: AppColors.mainColorStart,
            ),
          ),
        ),
      ),
    );
  }
}
