import 'package:final_project_iti/user/student/features/home/presentation/views/resource_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsList extends StatelessWidget {
  const CardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ResourceCard(
          title: 'Flutter Fundamentals: Complete Guide',
          subtitle:
              'Learn Flutter from basics to advanced concepts with practical examples',
          meta: 'Video • 2.5 hours',
          actionLabel: 'View',
          actionType: ResourceAction.view,
        ),
        SizedBox(height: 12.h),
        const ResourceCard(
          title: 'Introduction to Artificial Intelligence',
          subtitle: 'Comprehensive guide to AI concepts and implementations',
          meta: 'PDF • 45 pages',
          actionLabel: 'Download',
          actionType: ResourceAction.download,
        ),
        SizedBox(height: 12.h),
        const ResourceCard(
          title: 'DevOps Pipeline Implementation',
          subtitle: 'Step-by-step guide to creating efficient DevOps pipelines',
          meta: 'Link • Tutorial',
          actionLabel: 'Open',
          actionType: ResourceAction.open,
        ),
        SizedBox(height: 12.h),
        const ResourceCard(
          title: 'Cloud Computing Essentials',
          subtitle: 'Master the fundamentals of cloud computing and services',
          meta: 'Video • 1.8 hours',
          actionLabel: 'View',
          actionType: ResourceAction.view,
        ),
        SizedBox(height: 12.h),
        const ResourceCard(
          title: 'Cybersecurity Best Practices',
          subtitle: 'Essential security guidelines for modern applications',
          meta: 'PDF • 32 pages',
          actionLabel: 'Download',
          actionType: ResourceAction.download,
        ),
        SizedBox(height: 18.h),
      ],
    );
  }
}
