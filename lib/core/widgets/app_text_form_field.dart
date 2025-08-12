import 'package:final_project_iti/core/utilities/app_font_family.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.maxLines,
  });

  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      maxLines: maxLines,
      style: TextStyle(color: theme.colorScheme.onSurface),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: theme.colorScheme.surface,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyles.textStyleRegular16.copyWith(
          fontFamily: AppFontFamily.roboto,
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
      ),
    );
  }
}
