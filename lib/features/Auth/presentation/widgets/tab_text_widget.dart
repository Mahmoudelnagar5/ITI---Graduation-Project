import 'package:flutter/material.dart';

class TabTextWidget extends StatelessWidget {
  const TabTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Align(
        alignment: Alignment.center,
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
