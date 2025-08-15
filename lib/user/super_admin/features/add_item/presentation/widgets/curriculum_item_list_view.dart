import '../../../../../../core/routing/route_export.dart';
import 'curriculum_item_container.dart';

class CurriculumItemListView extends StatelessWidget {
  const CurriculumItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const CurriculumItemContainer();
      },
    );
  }
}
