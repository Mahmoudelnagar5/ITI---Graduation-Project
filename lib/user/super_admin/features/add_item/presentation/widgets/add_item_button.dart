import '../../../../../../core/routing/route_export.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key});

  void _showAddItemDialog(BuildContext context) {
    final TextEditingController itemController = TextEditingController();
    final cubit = AddItemCubit.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Add Curriculum Item',
            style: AppTextStyles.textStyleMedium14.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          content: TextField(
            controller: itemController,
            decoration: InputDecoration(
              hintText: 'Enter curriculum item',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: AppTextStyles.textStyleMedium14.copyWith(
                  color: AppColors.lightHintTextField,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (itemController.text.trim().isNotEmpty) {
                  cubit.addCurriculumItem(itemController.text.trim());
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'Add',
                style: AppTextStyles.textStyleMedium14.copyWith(
                  color: AppColors.mainColorStart,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _showAddItemDialog(context),
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.mainColorStart),
        ),
        child: Center(
          child: Icon(Icons.add, color: AppColors.mainColorStart, size: 24.r),
        ),
      ),
      label: Text(
        'Add Item',
        style: AppTextStyles.textStyleMedium14.copyWith(
          color: AppColors.mainColorStart,
        ),
      ),
    );
  }
}
