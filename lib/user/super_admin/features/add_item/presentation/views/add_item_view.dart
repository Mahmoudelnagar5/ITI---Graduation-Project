import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/add_item_app_bar.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/widgets/title_and_description_section.dart';
import 'package:final_project_iti/user/super_admin/features/add_item/presentation/controller/add_item_cubit/add_item_cubit.dart';
import 'package:final_project_iti/user/super_admin/features/add_resource/presentation/views/send_notification_view.dart';

import '../widgets/add_item_button.dart';
import '../widgets/curriculum_item_list_view.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String? headerTitle;
    TrackModel? editTrack;

    if (args is String) {
      headerTitle = args;
    } else if (args is Map) {
      headerTitle = (args['title'] as String?) ?? 'Edit Track';
      editTrack = args['track'] as TrackModel?;
    }

    // collection name for tracks is "Add Track" in the repo usage
    const String collectionName = 'Add Track';

    return BlocProvider(
      create: (context) => AddItemCubit()..prefillFromTrack(editTrack),
      child: BlocConsumer<AddItemCubit, AddItemState>(
        listener: (context, state) {
          if (state is AddItemSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Track ${editTrack == null ? 'added' : 'updated'} successfully!',
                      style: AppTextStyles.textStyleMedium14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SendNotificationView(),
              ),
            );
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
            appBar: AddItemAppBar(title: headerTitle),
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
                        Text(
                          'Curriculum Items',
                          style: AppTextStyles.textStyleMedium14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 16.sp,
                          ),
                        ),
                        Gap(16.h),
                        const CurriculumItemListView(),
                        const AddItemButton(),
                        Gap(18.h),
                        SendNotificationButton(
                          label: editTrack == null ? 'Save Changes' : 'Update',
                          onPressed: state is AddItemLoading
                              ? null
                              : () {
                                  if (editTrack == null) {
                                    cubit.addItem(
                                      headerTitle ?? collectionName,
                                    );
                                  } else {
                                    cubit.updateItem(
                                      collectionName: collectionName,
                                      id: editTrack.id,
                                    );
                                  }
                                },
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
