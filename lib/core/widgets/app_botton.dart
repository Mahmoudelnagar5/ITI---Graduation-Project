
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBotton extends StatelessWidget {
  const AppBotton({super.key, required this.child, this.onPressed, this.color});
  final Widget child;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: child,
      ),
    );
  }
}
