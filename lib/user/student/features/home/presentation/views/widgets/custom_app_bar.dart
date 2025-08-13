import 'package:final_project_iti/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utilities/assets_manager.dart';
import '../../../../../../../core/utilities/styles_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Image.asset(Assets.imagesFlutter),
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.itiFayoum,
                style: AppTextStyles.textStyleBold20.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              // const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.learningTracks,

                style: AppTextStyles.textStyleRegular14.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);
}
