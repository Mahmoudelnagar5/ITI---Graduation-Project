import 'package:final_project_iti/core/routing/route_export.dart';

class TrackContentView extends StatelessWidget {
  const TrackContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackModel =
        ModalRoute.of(context)?.settings.arguments as TrackModel?;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.mainColorStart,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              trackModel?.title ?? 'Track Title',
              style: AppTextStyles.textStyleBold20,
            ),

            Text(
              '5 Topics • 12 Weeks',
              style: AppTextStyles.textStyleRegular14,
            ),
          ],
        ),
      ),
      body: const TrackContentViewBody(),
    );
  }
}
