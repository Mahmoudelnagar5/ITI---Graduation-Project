import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.searchfillcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 20, color: AppColors.hinttextfield),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 14, color: AppColors.searchIconcolor),
              cursorColor: AppColors.mainColorStart,
              decoration: InputDecoration(
                isCollapsed: true,
                hintText: 'Search learning materials...',
                hintStyle: TextStyle(
                  color: AppColors.hinttextfield,
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
