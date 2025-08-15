import '../../../../../../core/routing/route_export.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
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
    //
    // onPressed: onPressed, child: child)
  }
}
