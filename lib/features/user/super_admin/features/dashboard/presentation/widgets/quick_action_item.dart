import '../../../../../../core/routing/route_export.dart';

class QuickActionItem extends StatelessWidget {
  const QuickActionItem({
    super.key,
    this.color,
    required this.text,
    required this.icon,
  });
  final Color? color;
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigation.pushName(
          context: context,
          route: AppRoutes.addItemView,
          argument: text,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color ?? AppColors.addcontant,
        ),
        child: Column(
          children: [
            IconButton(onPressed: null, icon: icon),
            const Gap(8),
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
