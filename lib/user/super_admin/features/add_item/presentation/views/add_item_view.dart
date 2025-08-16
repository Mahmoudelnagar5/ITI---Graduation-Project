import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/add_item_app_bar.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/title_and_description_section.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/controller/add_item_cubit/add_item_cubit.dart';

import '../widgets/add_item_button.dart';
import '../widgets/curriculum_item_list_view.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)?.settings.arguments as String?;
    return BlocProvider(
      create: (context) => AddItemCubit(),
      child: BlocConsumer<AddItemCubit, AddItemState>(
        listener: (context, state) {
          if (state is AddItemSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Track added successfully!',
                      style: AppTextStyles.textStyleMedium14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          } else if (state is AddItemFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: AppTextStyles.textStyleMedium14.copyWith(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = AddItemCubit.of(context);
          return Scaffold(
            appBar: AddItemAppBar(title: title),
            body: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleAndDescriptionSection(),
                        Gap(34.h),
                        // const CoverImageSection(),
                        // const Gap(28),
                        Text(
                          'Curriculum Items',
                          style: AppTextStyles.textStyleMedium14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                        Gap(16.h),
                        const CurriculumItemListView(),
                        const AddItemButton(),
                        Gap(18.h),
                        SendNotificationButton(
                          label: 'Save Changes',
                          onPressed: state is AddItemLoading
                              ? null
                              : () => cubit.addItem(title ?? ''),
                        ),
                        Gap(16.h),
                      ],
                    ),
                  ),
                ),
                if (state is AddItemLoading)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
