import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpCodeBoxes extends StatelessWidget {
  final int count;

  const OtpCodeBoxes({super.key, this.count = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        return Container(
          width: 50.w,
          height: 50.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: const Text("", style: TextStyle(fontSize: 20)),
        );
      }),
    );
  }
}
