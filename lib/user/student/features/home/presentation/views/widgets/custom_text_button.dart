import 'package:final_project_iti/l10n/app_localizations.dart';

import '../../../../../../../core/routing/route_export.dart';

class CustomTextButtom extends StatelessWidget {
  const CustomTextButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigation.pushWithReplacement(
          rootNavigator: true,
          context: context,
          route: AppRoutes.authRole,
        );
      },
      child: Container(
        height: 0.062.sh,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Theme.of(context).colorScheme.onPrimary),
            Text(
              AppLocalizations.of(context)!.logout,
              style: AppTextStyles.textStyleMedium16.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
