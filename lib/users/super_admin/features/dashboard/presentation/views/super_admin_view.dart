import '../../../../../../core/routing/route_export.dart';
import 'admin_profile_view.dart';
import 'dashboard_view.dart';

class SuperAdminView extends StatefulWidget {
  const SuperAdminView({super.key});

  @override
  State<SuperAdminView> createState() => _SuperAdminViewState();
}

class _SuperAdminViewState extends State<SuperAdminView> {
  int currentIndex = 0;
  List<Widget> pages = [const DashboardView(), const AdminProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavBarAdmin(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class BottomNavBarAdmin extends StatelessWidget {
  const BottomNavBarAdmin({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.mainColorStart,
      unselectedItemColor: AppColors.lightGrey,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
