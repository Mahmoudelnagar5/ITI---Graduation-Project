import 'package:final_project_iti/core/routing/route_export.dart';

class TracksView extends StatelessWidget {
  const TracksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(appBar: CustomAppBar(), body: TrackViewBody()),
    );
  }
}
