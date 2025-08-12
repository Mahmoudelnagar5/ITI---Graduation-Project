import '../../../../../../core/routing/route_export.dart';
import 'custom_container_info.dart' show CustomContainerInfo;

class ListViewItemsInfo extends StatelessWidget {
  const ListViewItemsInfo({super.key});
  final List<CustomContainerInfo> items = const [
    CustomContainerInfo(
      text: 'Active Tracks',
      value: '8',
      icon: Icons.track_changes,
    ),
    CustomContainerInfo(text: 'Total Users', value: '256', icon: Icons.people),
    CustomContainerInfo(text: 'Total Courses', value: '12', icon: Icons.school),
    CustomContainerInfo(
      text: 'Total Tasks',
      value: '100',
      icon: Icons.task_alt,
    ),
    CustomContainerInfo(
      text: 'Total Resources',
      value: '15',
      icon: Icons.library_books,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: items[index],
          );
        },
      ),
    );
  }
}
