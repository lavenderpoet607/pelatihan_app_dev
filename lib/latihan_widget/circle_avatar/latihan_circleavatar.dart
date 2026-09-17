import 'package:flutter/material.dart';

class LatihanCircleavatar extends StatelessWidget {
  const LatihanCircleavatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/736x/e5/25/c9/e525c91d9c8fb7ca98f2cc81db0a4d4b.jpg',
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Halaman Circle Avatar',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Ini adalah tampilan konten Halaman Circle Avatar',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
