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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boxSize = constraints.maxHeight * 0.5;
          final size = boxSize.clamp(0.0, 200.0);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.deepPurple, width: 3),
                    ),
                    child: const Center(child: Text('JMK 48')),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Kamu berada di dalam body scaffold, haha ireng',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
