import 'package:flutter/material.dart';

String? Function(String?) validationEmailMethod({
  required BuildContext context,
}) {
  return (String? email) {
    final trimmedEmail = email?.trim();

    if (trimmedEmail == null || trimmedEmail.isEmpty) {
      return 'Email is required';
    } else if (!_isEmail(trimmedEmail)) {
      return 'Invalid email format';
    } else {
      return null; // Valid
    }
  };
}

bool _isEmail(String email) {
  const pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$";
  final regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}
