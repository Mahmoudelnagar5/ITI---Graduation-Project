import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.hintText});
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 229, 231, 235),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 20, color: AppColors.hinttextfield),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.searchIconcolor,
              ),
              cursorColor: AppColors.mainColorStart,
              decoration: InputDecoration(
                isCollapsed: true,
                hintText: hintText,
                hintStyle: const TextStyle(
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
