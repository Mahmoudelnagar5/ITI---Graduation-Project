import 'package:final_project_iti/core/routing/route_export.dart';

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppTextStyles.textStyleMedium14.copyWith(
          fontFamily: AppFontFamily.roboto,
          color: AppColors.titletextfield,
        ),
      ),
    );
  }
}
