import '../../../../../../core/routing/route_export.dart';
import 'custom_container_info.dart';
import 'list_view_items_info.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [ListViewItemsInfo()]),
      ),
    );
  }
}
