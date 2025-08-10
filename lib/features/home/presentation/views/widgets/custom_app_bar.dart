import 'package:flutter/material.dart';

import '../../../../../core/utilities/assets_manager.dart';
import '../../../../../core/utilities/styles_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Image.asset(Assets.imagesTracklogo),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ITI Fayoum', style: AppTextStyles.textStyleBold20),
              // const SizedBox(height: 4),
              Text('Learning Tracks', style: AppTextStyles.textStyleRegular14),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
