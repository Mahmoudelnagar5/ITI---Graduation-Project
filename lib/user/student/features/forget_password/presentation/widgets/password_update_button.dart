import 'package:flutter/material.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';

class PasswordUpdateButton extends StatelessWidget {
  final VoidCallback onPressed;
  const PasswordUpdateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColorStart,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: const Text("Update Password"),
      ),
    );
  }
}
