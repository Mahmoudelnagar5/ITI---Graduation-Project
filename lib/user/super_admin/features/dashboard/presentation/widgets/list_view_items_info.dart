import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../../core/routing/route_export.dart';
import 'custom_container_info.dart' show CustomContainerInfo;

class ListViewItemsInfo extends StatelessWidget {
  const ListViewItemsInfo({super.key});

  Stream<int> _countOf(String collection) {
    return FirebaseFirestore.instance
        .collection(collection)
        .snapshots()
        .map((s) => s.docs.length);
  }

  Widget _counterCard({
    required String label,
    required IconData icon,
    required Stream<int> stream,
  }) {
    return StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        final value = snapshot.hasError ? '0' : (snapshot.data ?? 0).toString();
        return CustomContainerInfo(text: label, icon: icon, value: value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      _counterCard(
        label: 'Active Tracks',
        icon: Icons.track_changes,
        stream: _countOf('Add Track'),
      ),
      _counterCard(
        label: 'Total Resources',
        icon: Icons.library_books,
        stream: _countOf('resources'),
      ),
      _counterCard(
        label: 'Total Rounds',
        icon: Icons.school_sharp,
        stream: _countOf('Manage Rounds'),
      ),
      _counterCard(
        label: 'Total Courses',
        icon: Icons.school,
        stream: _countOf('Add Courses'),
      ),
    ];

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
