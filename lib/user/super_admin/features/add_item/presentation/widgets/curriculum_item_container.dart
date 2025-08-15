import '../../../../../../core/routing/route_export.dart';

class CurriculumItemContainer extends StatelessWidget {
  const CurriculumItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.addcontant,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Data Structures',
            style: AppTextStyles.textStyleRegular16.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              fontSize: 16.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
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
