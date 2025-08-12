import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:final_project_iti/user/student/features/home/presentation/views/widgets/tracks_view_body.dart';

class TracksView extends StatelessWidget {
  const TracksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(appBar: CustomAppBar(), body: TrackViewBody()),
    );
  }
}
