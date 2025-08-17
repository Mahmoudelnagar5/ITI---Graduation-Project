import '../../../../../../core/routing/route_export.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/controller/add_item_cubit/add_item_cubit.dart';
import 'curriculum_item_container.dart';

class CurriculumItemListView extends StatelessWidget {
  const CurriculumItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddItemCubit, AddItemState>(
      builder: (context, state) {
        final cubit = AddItemCubit.of(context);
        final items = cubit.curriculumItems;

        if (items.isEmpty) {
          return Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.addcontant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'No curriculum items added yet',
              style: AppTextStyles.textStyleRegular16.copyWith(
                color: AppColors.lightHintTextField,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CurriculumItemContainer(
              item: items[index],
              index: index,
              onDelete: () => cubit.removeCurriculumItem(index),
            );
          },
        );
      },
    );
  }
}
