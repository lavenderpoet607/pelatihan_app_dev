import 'package:flutter/material.dart';

class LatihanTextfield extends StatelessWidget {
  const LatihanTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar widget TextField'),
        backgroundColor: const Color.fromARGB(255, 227, 90, 255),
        foregroundColor: Colors.white,
      ),
      body: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'jawa-jawa',
          hintText: 'Enter a search term',
        ),
      ),
    );
  }
}
