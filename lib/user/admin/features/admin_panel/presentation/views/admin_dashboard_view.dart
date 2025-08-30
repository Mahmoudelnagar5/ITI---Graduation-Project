import 'package:flutter/material.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/l10n/app_localizations.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.adminDashboard ?? 'Admin Dashboard',
          style: AppTextStyles.textStyleMedium20.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DashboardCard(
              icon: Icons.add_circle_outline,
              label: loc.addNewQuestion ?? 'Add New Question',
              onTap: () {
                Navigator.of(context).pushNamed('/addFaqQuestion');
              },
            ),
            const SizedBox(height: 32),
            _DashboardCard(
              icon: Icons.question_answer,
              label: loc.manageUserQuestions ?? 'Manage User Questions',
              onTap: () {
                Navigator.of(context).pushNamed('/manageUserQuestions');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _DashboardCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 32),
        decoration: BoxDecoration(
          color: AppColors.lightCardBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppTextStyles.cardShadow,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: AppColors.mainColorStart),
            const SizedBox(height: 16),
            Text(label, style: AppTextStyles.textStyleMedium18),
          ],
        ),
      ),
    );
  }
}
