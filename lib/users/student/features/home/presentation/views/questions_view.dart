import 'package:final_project_iti/core/routing/route_export.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Questions', style: AppTextStyles.textStyleMedium20),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const QuestionsViewBody(),
    );
  }
}
