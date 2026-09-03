import 'package:flutter/material.dart';

class LatihanRichText extends StatelessWidget {
  const LatihanRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar widget RichText'),
        foregroundColor: const Color.fromARGB(255, 248, 207, 207),
        backgroundColor: Colors.black,
      ),
      body: RichText(
        text: const TextSpan(
          text: 'Belajar widget RichText',
          style: TextStyle(color: Colors.white),
          children: <TextSpan>[
            TextSpan(
              text: 'Belajar ',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'Flutter ',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 14, 241),
                fontStyle: FontStyle.italic,
              ),
            ),
            TextSpan(
              text: 'itu ',
              style: TextStyle(
                color: Color.fromARGB(255, 10, 10, 10),
                fontStyle: FontStyle.italic,
              ),
            ),
            TextSpan(
              text: 'Mudah',
              style: TextStyle(
                color: Color.fromARGB(255, 14, 241, 63),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
