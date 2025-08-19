import 'package:flutter/material.dart';

String? Function(String?)? validationPasswordMethod({
  required BuildContext context,
}) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }

    if (value.length < 6) {
      return 'Less length';
    }

    return null;
  };
}
