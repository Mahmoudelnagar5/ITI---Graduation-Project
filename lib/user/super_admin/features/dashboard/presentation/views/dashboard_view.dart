import '../../../../../../core/routing/route_export.dart';
import '../widgets/custom_app_bar_admin.dart';
import '../widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustonAppBarAdmin(),
      body: DashboardViewBody(),
    );
  }
}
