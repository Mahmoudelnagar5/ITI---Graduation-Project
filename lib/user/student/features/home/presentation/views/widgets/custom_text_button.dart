import 'package:final_project_iti/core/routing/route_export.dart';

class CustomTextButtom extends StatelessWidget {
  const CustomTextButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 0.062.sh,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.mainColorStart,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, color: AppColors.white),
            Text(
              'logout',
              style: AppTextStyles.textStyleMedium16.copyWith(
                color: AppColors.white,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
