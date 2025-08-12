import 'package:final_project_iti/core/routing/route_export.dart';

class ForgotPasswordBotton extends StatelessWidget {
  const ForgotPasswordBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          // TODO  add onTap
        },
        child: Text(
          "Forgot Password",
          style: AppTextStyles.textStyleMedium14.copyWith(
            color: AppColors.mainColorStart,
            fontFamily: AppFontFamily.roboto,
          ),
        ),
      ),
    );
  }
}
