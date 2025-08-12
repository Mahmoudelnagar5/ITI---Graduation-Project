import 'package:final_project_iti/core/routing/route_export.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
  });
  final TextEditingController? controller;
  final String hintText;

  final String? Function(String?)? validator;
  @override
  State<PasswordTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<PasswordTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: TextStyle(color: theme.colorScheme.onSurface),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: theme.colorScheme.surface,
        filled: true,
        hintText: widget.hintText,
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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: obscureText
              ? const Icon(Icons.visibility_outlined)
              : const Icon(Icons.visibility_off_outlined),
        ),
      ),
    );
  }
}
