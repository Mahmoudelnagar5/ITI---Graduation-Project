import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabTextWidget extends StatelessWidget {
  const TabTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Align(
        alignment: Alignment.center,
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
