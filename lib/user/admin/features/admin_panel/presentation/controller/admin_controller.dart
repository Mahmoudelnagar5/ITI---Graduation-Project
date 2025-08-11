import 'package:flutter/material.dart';

class AdminController {
  final titleController = TextEditingController();
  final messageController = TextEditingController();

  void clear() {
    titleController.clear();
    messageController.clear();
  }

  void dispose() {
    titleController.dispose();
    messageController.dispose();
  }
}
