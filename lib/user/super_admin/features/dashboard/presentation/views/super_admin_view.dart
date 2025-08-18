import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../../../../core/routing/route_export.dart';
import '../widgets/custom_app_bar_admin.dart';
import '../widgets/my_slider.dart';
import 'admin_profile_view.dart';
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
  List<Widget> pages = [const DashboardView(), const AdminProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustonAppBarAdmin(sliderDrawerKey: _sliderDrawerKey),
      body: SliderDrawer(
        appBar: CustonAppBarAdmin(sliderDrawerKey: _sliderDrawerKey),
        slider: MySlider(sliderDrawerKey: _sliderDrawerKey),
        key: _sliderDrawerKey,
        child: const DashboardView(),
      ),
    );
  }
}
