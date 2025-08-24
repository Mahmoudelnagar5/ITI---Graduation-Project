import '../../../../../../core/routing/route_export.dart';
import 'gradient_text.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text: 'Welcome to AI Assistant',
      style: AppTextStyles.textStyleBold24.copyWith(fontSize: 30.sp),
      gradient: const LinearGradient(
        colors: [AppColors.mainColorStart, AppColors.darkDividerColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
