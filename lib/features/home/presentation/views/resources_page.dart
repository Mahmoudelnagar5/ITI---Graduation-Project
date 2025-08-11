import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/features/home/data/models/cards_data_list.dart';
import 'package:final_project_iti/features/home/presentation/views/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  final tracks = [
    'All',
    'Flutter',
    'AI',
    'DevOps',
    'Web Dev',
    'Security',
    'Network',
    'Data Science',
    'Game Dev',
    'UI/UX',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('ITI Learning Resources'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list,
              size: 22.sp,
              color: AppColors.searchIconcolor,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                builder: (context) {
                  return ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    children: tracks.map((track) {
                      return ListTile(
                        title: Text(track),
                        onTap: () {
                          debugPrint("Selected track: $track");
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  );
                },
              );
            },
          ),
        ],
        backgroundColor: AppColors.scaffoldBg,
      ),
      body: SafeArea(
        child: Padding(
          padding: AppTextStyles.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(),
              SizedBox(height: 14.h),

              // Selectable scrollable row
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: tracks.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8.w),
                  itemBuilder: (context, index) {
                    final isActive = index == selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.mainColorStart
                              : AppColors.searchfillcolor,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Text(
                          tracks[index],
                          style: TextStyle(
                            color: isActive
                                ? Colors.white
                                : AppColors.searchIconcolor,
                            fontWeight: isActive
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),

              const Expanded(child: CardsList()),
            ],
          ),
        ),
      ),
    );
  }
}
