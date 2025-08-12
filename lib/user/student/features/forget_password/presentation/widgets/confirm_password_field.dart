import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:final_project_iti/core/widgets/app_text_form_field.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const ConfirmPasswordField({super.key, required this.controller});

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "Confirm Password",
      controller: widget.controller,
      obscureText: !_showConfirmPassword,
      suffixIcon: IconButton(
        icon: Icon(
          _showConfirmPassword ? Icons.visibility_off : Icons.visibility,
          color: AppColors.black,
        ),
        onPressed: () {
          setState(() {
            _showConfirmPassword = !_showConfirmPassword;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please confirm your Password";
        }
        if (value != widget.controller.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }
}
