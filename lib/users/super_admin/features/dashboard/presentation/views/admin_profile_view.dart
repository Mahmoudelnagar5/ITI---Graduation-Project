import 'package:flutter/material.dart';

class AdminProfileView extends StatelessWidget {
  const AdminProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Profile')),
      body: const Center(child: Text('Admin Profile')),
    );
  }
}
