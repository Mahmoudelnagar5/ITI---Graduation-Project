import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utilities/assets_manager.dart';
import '../../../../../../../core/utilities/styles_manager.dart';
import '../../../data/models/question_,model.dart';
import 'institute_answer.dart';

class QuestionItem extends StatefulWidget {
  const QuestionItem({super.key, required this.questionModel});
  final QuestionModel questionModel;

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
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
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
                      widget.questionModel.title,
                      style: AppTextStyles.textStyleMedium16.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      widget.questionModel.desc,
                      style: AppTextStyles.textStyleRegular14.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                icon: Icon(
                  Icons.star_border_outlined,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                  size: 24.sp,
                ),
                onPressed: () {},
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
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(Assets.imagesAnsIcon),
                  const Gap(8),
                  Text(
                    'Institute Answer',
                    style: AppTextStyles.textStyleMedium14.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: _isAnswerVisible ? 0.25 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isAnswerVisible) ...[
            const Gap(16),
            InstituteAnswer(instituteAnswer: widget.questionModel.answer),
          ],
        ],
      ),
    );
  }
}
