import 'package:flutter/material.dart';

class LatihanScaffold extends StatelessWidget {
  const LatihanScaffold({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Scaffold'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.deepPurple, // Border color
                width: 3, // Border thickness
              ),
            ),
            child: const Center(child: Text('JMK 48')),
          ),
          Text(
            'Kamu berada di dalam body scaffold, haha ireng',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}