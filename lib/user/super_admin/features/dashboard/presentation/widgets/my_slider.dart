import 'package:flutter/cupertino.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../../../../core/routing/route_export.dart';

/// My Drawer Slider
class MySlider extends StatelessWidget {
  const MySlider({super.key, required this.sliderDrawerKey});

  final GlobalKey<SliderDrawerState> sliderDrawerKey;

  /// Icons
  static const List<IconData> icons = [
    Icons.dashboard,
    CupertinoIcons.settings,
    Icons.logout,
  ];

  /// Texts
  static const List<String> texts = ["Dashboard", "Settings", "Logout"];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.white, AppColors.mainColorStart, AppColors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundImage: const AssetImage(Assets.imagesProfile),
          ),
          const SizedBox(height: 8),
          Text("Mahmoud Elnagar", style: textTheme.headlineMedium),
          Text("ITI Admin", style: textTheme.headlineSmall),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * .3,
            child: ListView.builder(
              itemCount: icons.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                return ListTile(
                  contentPadding: const EdgeInsetsGeometry.all(8),
                  onTap: () => sliderDrawerKey.currentState?.toggle(),
                  leading: Icon(icons[i], color: Colors.white, size: 30),
                  title: Text(
                    texts[i],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
