import '../../../../../../core/routing/route_export.dart';

class CurriculumItemContainer extends StatelessWidget {
  const CurriculumItemContainer({
    super.key,
    required this.item,
    required this.index,
    required this.onDelete,
  });

  final String item;
  final int index;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.addcontant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              item,
              style: AppTextStyles.textStyleRegular16.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                fontSize: 16.sp,
              ),
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete,
              color: AppColors.lightHintTextField,
              size: 30.r,
            ),
          ),
        ],
      ),
    );
  }
}
