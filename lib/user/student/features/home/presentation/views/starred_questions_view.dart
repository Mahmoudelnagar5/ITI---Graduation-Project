import '../../../../../../../core/routing/route_export.dart';
import '../../../../../../../l10n/app_localizations.dart';
import 'package:final_project_iti/user/student/features/home/data/models/question_model.dart';
import '../manager/starred_questions/starred_questions_cubit.dart';
import '../manager/starred_questions/starred_questions_state.dart';
import '../widgets/question_item.dart';

class StarredQuestionsView extends StatefulWidget {
  const StarredQuestionsView({super.key});

  @override
  State<StarredQuestionsView> createState() => _StarredQuestionsViewState();
}

class _StarredQuestionsViewState extends State<StarredQuestionsView> {
  @override
  void initState() {
    super.initState();
    context.read<StarredQuestionsCubit>().loadStarredQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.starredQuestions,
          style: AppTextStyles.textStyleMedium20.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<StarredQuestionsCubit, StarredQuestionsState>(
        builder: (context, state) {
          if (state is StarredQuestionsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StarredQuestionsEmpty) {
            return _buildEmptyState();
          } else if (state is StarredQuestionsLoaded) {
            return _buildQuestionsList(state.starredQuestions);
          } else if (state is StarredQuestionsError) {
            return _buildErrorState(state.message);
          }
          return _buildEmptyState();
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_border,
            size: 80.r,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
          Gap(16.h),
          Text(
            'No Starred Questions',
            style: AppTextStyles.textStyleMedium18.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          Gap(8.h),
          Text(
            'Questions you star will appear here',
            style: AppTextStyles.textStyleRegular14.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsList(List<QuestionModel> starredQuestions) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<StarredQuestionsCubit>().loadStarredQuestions();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: starredQuestions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: QuestionItem(questionModel: starredQuestions[index]),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80.r,
            color: Theme.of(context).colorScheme.error,
          ),
          Gap(16.h),
          Text(
            'Error',
            style: AppTextStyles.textStyleMedium18.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          Gap(8.h),
          Text(
            message,
            style: AppTextStyles.textStyleRegular14.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
