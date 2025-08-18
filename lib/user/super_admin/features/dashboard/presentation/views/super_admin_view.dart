import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../../../../core/routing/route_export.dart';
import '../widgets/custom_app_bar_admin.dart';
import '../widgets/my_slider.dart';
import 'dashboard_view.dart';

class SuperAdminView extends StatefulWidget {
  const SuperAdminView({super.key});

  @override
  State<SuperAdminView> createState() => _SuperAdminViewState();
}

class _SuperAdminViewState extends State<SuperAdminView> {
  int currentIndex = 0;
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustonAppBarAdmin(sliderDrawerKey: _sliderDrawerKey),
      body: SliderDrawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustonAppBarAdmin(sliderDrawerKey: _sliderDrawerKey),
        slider: MySlider(sliderDrawerKey: _sliderDrawerKey),
        key: _sliderDrawerKey,
        child: const DashboardView(),
      ),
    );
  }
}
