import '../../../../../../core/routing/route_export.dart';
import 'custom_container_info.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomContainerInfo(
                  text: 'Active Users',
                  icon: Icons.track_changes,
                  value: '8',
                ),
                Gap(16),
                CustomContainerInfo(
                  text: 'Total Users',
                  icon: Icons.people,
                  value: '256',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
