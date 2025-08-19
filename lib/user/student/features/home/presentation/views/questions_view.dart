import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/l10n/app_localizations.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.commonQuestions,

          style: AppTextStyles.textStyleMedium20.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const QuestionsViewBody(),
    );
  }
}
