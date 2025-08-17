import 'package:final_project_iti/core/routing/route_export.dart';

class TrackContentView extends StatelessWidget {
  const TrackContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackModel =
        ModalRoute.of(context)?.settings.arguments as TrackModel?;
    final List<String> contents = trackModel!.contents;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              trackModel.title,
              style: AppTextStyles.textStyleBold20.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            Text(
              '${contents.length} Topics • 12 Weeks',
              style: AppTextStyles.textStyleRegular14.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
      body: const TrackContentViewBody(),
    );
  }
}
