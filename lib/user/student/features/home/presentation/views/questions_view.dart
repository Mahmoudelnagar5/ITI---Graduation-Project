import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/add_question_view.dart';

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
      floatingActionButton: 
    
      Builder(
        
        builder: (context) => FloatingActionButton(
          heroTag: "star",
          backgroundColor: AppColors.mainColorStart,
          onPressed: () async {
            final result = await Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const AddQuestionView()));
            if (result == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(
                          context,
                        )!.questionSubmittedSuccessfully 

                  ),
                ),
              );
            }
          },
          tooltip: AppLocalizations.of(context)!.addQuestion ,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
