import 'package:final_project_iti/core/routing/route_export.dart';

class AddResourceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddResourceAppBar({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.imagesDetailsIcon,
              color: Theme.of(context).colorScheme.onSurface,
              height: 24.r,
              width: 24.r,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title ?? '',
        style: AppTextStyles.textStyleMedium18.copyWith(
          fontFamily: AppFontFamily.inter,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
