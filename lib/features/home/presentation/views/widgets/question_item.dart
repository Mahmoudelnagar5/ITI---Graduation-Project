import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/assets_manager.dart';
import '../../../../../core/utilities/styles_manager.dart';
import 'institute_answer.dart';

class QuestionItem extends StatefulWidget {
  const QuestionItem({super.key});

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  bool _isAnswerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Why was I marked absent on Monday?',
                      style: AppTextStyles.textStyleMedium16.copyWith(
                        color: AppColors.hometusertitle,
                      ),
                    ),
                    Text(
                      // 'I attended the lecture on time, but my attendance was recorded as absent in the system. Can I review my attendance record and correct the error?',
                      'I was present in class but my attendance shows I was absent.',
                      style: AppTextStyles.textStyleRegular14.copyWith(
                        color: AppColors.hometusersubtitle,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                icon: Icon(
                  Icons.star_border_outlined,
                  color: AppColors.hinttextfield,
                  size: 24.sp,
                ),
                onPressed: () {
                  //TODO: Implement favorite functionality
                },
              ),
            ],
          ),
          const Gap(16),
          InkWell(
            onTap: () {
              setState(() {
                _isAnswerVisible = !_isAnswerVisible;
              });
            },
            child: Container(
              height: 45.h,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: AppColors.addcontant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(Assets.imagesAnsIcon),
                  const Gap(8),
                  Text(
                    'Institute Answer',
                    style: AppTextStyles.textStyleMedium14.copyWith(
                      color: AppColors.mainColorStart,
                    ),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: _isAnswerVisible ? 0.25 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.hinttextfield,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isAnswerVisible) ...[const Gap(16), const InstituteAnswer()],
        ],
      ),
    );
  }
}
