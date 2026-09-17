import 'package:flutter/material.dart';

class LatihanWidgetCircleAvatar extends StatelessWidget {
  const LatihanWidgetCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar widget CircleAvatar'),
        backgroundColor: const Color.fromARGB(255, 112, 100, 226),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(
            'https://i.pinimg.com/736x/e5/25/c9/e525c91d9c8fb7ca98f2cc81db0a4d4b.jpg',
          ),
        ),
      ),
    );
  }
}
