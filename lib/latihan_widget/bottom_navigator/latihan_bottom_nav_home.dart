import 'package:flutter/material.dart';

class LatihanBottomNavHome extends StatelessWidget {
  const LatihanBottomNavHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.amberAccent.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.home_rounded,
                size: 48,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Halaman 1: Beranda",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Ini adalah tampilan konten untuk tab Home pada BottomNavigationBar.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
