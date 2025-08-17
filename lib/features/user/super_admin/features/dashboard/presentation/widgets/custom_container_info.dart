import '../../../../../../core/routing/route_export.dart';

class CustomContainerInfo extends StatelessWidget {
  const CustomContainerInfo({
    super.key,
    required this.text,
    this.icon,
    required this.value,
  });
  final String text;
  final IconData? icon;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,

      child: Container(
        width: 160.w,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 4.h,
              width: 64.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.mainColorStart,
              ),
            ),
            const Gap(12),
            Icon(
              icon ?? Icons.info_outline,
              size: 40.r,
              color: AppColors.mainColorStart,
            ),
            const Gap(10),
            Text(
              text,
              style: AppTextStyles.textStyleRegular14.copyWith(
                color: AppColors.hometusersubtitle,
              ),
            ),
            const Gap(4),
            Text(
              value,
              style: AppTextStyles.textStyleSemiBold20.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            // const Gap(16),
          ],
        ),
      ),
    );
  }
}
