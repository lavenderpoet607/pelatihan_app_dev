import 'package:flutter/material.dart';

class LatihanWidgetIcon extends StatelessWidget {
  const LatihanWidgetIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar widget Icon'),
        backgroundColor: const Color.fromARGB(255, 236, 42, 227),
        leading: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        actions: [
          Icon(
            Icons.view_headline,
            color: Color.fromARGB(255, 7, 7, 7),
            size: 50,
          ),
        ],
      ),
    );
  }
}
