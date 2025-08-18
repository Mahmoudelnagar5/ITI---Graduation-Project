import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../../../../core/routing/route_export.dart';

class CustonAppBarAdmin extends StatelessWidget implements PreferredSizeWidget {
  const CustonAppBarAdmin({super.key, required this.sliderDrawerKey});
  final GlobalKey<SliderDrawerState> sliderDrawerKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => sliderDrawerKey.currentState?.toggle(),
              child: const CircleAvatar(
                backgroundColor: Color(0xffE5E7EB),
                radius: 26,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(Assets.imagesProfile),
                ),
              ),
            ),
            const Gap(10),
            Text(
              'ITI Admin',
              style: AppTextStyles.textStyleMedium20.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Badge(
            label: Text(
              '3',
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ),
            backgroundColor: Colors.red,
            child: Icon(
              Icons.notifications,
              size: 38.r,
              color: AppColors.hometusersubtitle,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
