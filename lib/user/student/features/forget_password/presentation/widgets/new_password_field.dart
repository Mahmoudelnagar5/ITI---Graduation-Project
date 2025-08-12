import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:final_project_iti/core/widgets/app_text_form_field.dart';

class NewPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const NewPasswordField({super.key, required this.controller});

  @override
  State<NewPasswordField> createState() => _NewPasswordFieldState();
}

class _NewPasswordFieldState extends State<NewPasswordField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "Enter New Password",
      controller: widget.controller,
      obscureText: !_showPassword,
      suffixIcon: IconButton(
        icon: Icon(
          _showPassword ? Icons.visibility_off : Icons.visibility,
          color: AppColors.black,
        ),
        onPressed: () {
          setState(() {
            _showPassword = !_showPassword;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your Password";
        }
        return null;
      },
    );
  }
}
