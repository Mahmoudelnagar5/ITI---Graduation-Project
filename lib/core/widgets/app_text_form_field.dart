import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key, required this.hintText, this.controller});
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.black),
      controller: controller,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyles.textStyleRegular16.copyWith(
          fontFamily: AppFontFamily.roboto,
          color: AppColors.hinttextfield,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.unfocusedTextFieldBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.mainColorStart),
        ),
      ),
    );
  }
}
