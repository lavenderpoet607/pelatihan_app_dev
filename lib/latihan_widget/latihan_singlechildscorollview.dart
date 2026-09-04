import 'package:flutter/material.dart';

class LatihanSinglechildscorollview extends StatelessWidget {
  const LatihanSinglechildscorollview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Single Child"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amberAccent.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.assignment,
                color: Colors.amberAccent,
                size: 26,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                'TUGAS MANDIRI - Ini adalah teks yang sangat panjang sekali untuk menguji fitur Text Overflow di Flutter agar teks yang melebihi batas layar otomatis dipotong dengan tanda elipsis atau titik-titik di ujungnya.',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
