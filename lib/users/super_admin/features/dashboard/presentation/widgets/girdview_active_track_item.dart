import '../../../../../../core/routing/route_export.dart';
import 'active_track_item.dart';

class GirdViewActiveTrackItem extends StatelessWidget {
  const GirdViewActiveTrackItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => const ActiveTrackItem(),
    );
  }
}
