import 'package:flutter/material.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/assets_manager.dart';
import '../../../../../core/utilities/styles_manager.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 24),
      decoration: InputDecoration(
        fillColor: AppColors.searchfillcolor,
        filled: true,
        hintText: 'Search tracks...',
        hintStyle: AppTextStyles.textStyleRegular16.copyWith(
          color: const Color(0xff9CA3AF),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Image.asset(Assets.imagesSearchIcon),
      ),
    );
  }
}
