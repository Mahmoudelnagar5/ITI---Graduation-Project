import '../../../../../../core/routing/route_export.dart';

class QuickActionItem extends StatelessWidget {
  const QuickActionItem({super.key, this.color, required this.text, this.icon});
  final Color? color;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 140.w,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color ?? AppColors.addcontant,
        ),
        child: Column(
          children: [
            Icon(
              icon ?? Icons.add,
              color: color != null ? AppColors.white : AppColors.titletextfield,
              size: 28.r,
            ),
            const Gap(12),
            FittedBox(
              child: Text(
                text,
                style: AppTextStyles.textStyleMedium14.copyWith(
                  color: color != null
                      ? AppColors.white
                      : AppColors.titletextfield,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
