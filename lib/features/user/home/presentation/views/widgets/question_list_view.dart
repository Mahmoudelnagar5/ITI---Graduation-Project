import 'package:flutter/material.dart';

import 'question_item.dart';

class QuestionListView extends StatelessWidget {
  const QuestionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: QuestionItem(),
        );
      },
    );
  }
}
