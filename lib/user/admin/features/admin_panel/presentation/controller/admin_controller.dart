import 'package:flutter/material.dart';

class AdminController {
  final titleController = TextEditingController();
  final messageController = TextEditingController();
  final instituteAnswerController = TextEditingController();

  void clear() {
    titleController.clear();
    messageController.clear();
    instituteAnswerController.clear();
  }

  void dispose() {
    titleController.dispose();
    messageController.dispose();
    instituteAnswerController.dispose();
  }
}
