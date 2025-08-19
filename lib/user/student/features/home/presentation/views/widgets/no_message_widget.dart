import '../../../../../../../core/routing/route_export.dart';
import 'welcome_text.dart';

class NoMessagesWidget extends StatelessWidget {
  const NoMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WelcomeText(),
            Gap(8.h),
            Text(
              'How can I help you today?',
              style: AppTextStyles.textStyleRegular16.copyWith(
                fontFamily: AppFontFamily.inter,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
