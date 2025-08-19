import 'package:final_project_iti/core/routing/route_export.dart';

import '../../data/admin_repo/admin_repo.dart';
import '../controller/admin_cubit/admin_cubit.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({super.key});

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  final AdminController controller = AdminController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminCubit(AdminRepoImpl()),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
          title: Text(
            'ITI Admin Panel',
            style: AppTextStyles.textStyleBold20.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          backgroundColor: AppColors.white,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateNotificationCard(controller: controller),
              SizedBox(height: 20.h),
              Text(
                'Previous Notifications',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              const PreviousNotificationCard(
                title: 'Database Design Workshop',
                dateTime: 'Today, 2:30 PM',
                description:
                    'Join us for an interactive workshop on database design principles and best practices...',
              ),
              const PreviousNotificationCard(
                title: 'Frontend Development Tips',
                dateTime: 'Yesterday, 11:00 AM',
                description:
                    'Here are some essential tips for improving your frontend development skills...',
              ),
              const PreviousNotificationCard(
                title: 'API Integration Guide',
                dateTime: 'Jan 15, 2024',
                description:
                    'Learn how to effectively integrate APIs into your applications...',
              ),
            ],
          ),
        ),
        // bottomNavigationBar: const AdminBottomNavBar(),
      ),
    );
  }
}
