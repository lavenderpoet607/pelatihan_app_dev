import 'package:flutter/material.dart';

class LatihanColumn extends StatelessWidget {
  const LatihanColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Belajar widget Column'),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Hallo text ini berada di baris pertama'),
            Text('Hallo text ini berada di baris kedua'),
            Text('Hallo text ini berada di baris ketiga'),
            Text('Hallo text ini berada di baris keempat'),
            Text('Hallo text ini berada di baris kelima'),
          ],
        ),
      ),
    );
  }
}
