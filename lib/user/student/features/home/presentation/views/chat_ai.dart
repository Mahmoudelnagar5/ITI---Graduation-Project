import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatAI extends StatefulWidget {
  const ChatAI({super.key});

  @override
  ChatAIState createState() => ChatAIState();
}

class ChatAIState extends State<ChatAI> {
  final _chatController = InMemoryChatController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
        chatController: _chatController,
        currentUserId: 'user1',
        onMessageSend: (text) {
          _chatController.insertMessage(
            TextMessage(
              // Better to use UUID or similar for the ID - IDs must be unique
              id: '${Random().nextInt(1000) + 1}',
              authorId: 'user1',
              createdAt: DateTime.now().toUtc(),
              text: text,
            ),
          );
        },
        resolveUser: (UserID id) async {
          return User(id: id, name: 'John Doe');
        },
      ),
    );
  }
}
