import 'package:flutter/material.dart';

class TrackContentView extends StatelessWidget {
  const TrackContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FLutter Track Content')),
      body: const Center(child: Text('Track Content Goes Here')),
    );
  }
}
