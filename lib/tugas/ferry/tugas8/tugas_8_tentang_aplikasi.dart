import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/tugas_8_widgets.dart';

class Tugas8TentangTab extends StatelessWidget {
  const Tugas8TentangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber.shade300),
            ),
            child: Row(
              children: [
                Icon(Icons.lock_outline_rounded, color: Colors.amber.shade900),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Drawer dinonaktifkan pada halaman ini. Ikon menu ditiadakan dan gesture swipe tidak membuka drawer.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.amber.shade900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Center(
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0284C7).withAlpha(25),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.navigation_rounded,
                    size: 50,
                    color: Color(0xFF0284C7),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Aplikasi Navigasi Flutter",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Milky Cream",
                    color: Color(0xFF0284C7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  "Tugas 8 - BottomNavigationBar & Conditional Drawer",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Penjelasan Singkat",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Aplikasi ini dibangun menggunakan framework Flutter dengan struktur navigasi BottomNavigationBar yang menampilkan 2 tampilan berbeda:\n"
                    "1. Tab Home: Menampilkan form input interaktif Tugas 7 dengan Drawer yang tetap aktif dan berfungsi.\n"
                    "2. Tab Tentang Aplikasi: Menampilkan informasi detail deskripsi aplikasi, nama pembuat, dan versi dengan Drawer yang dinonaktifkan.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                  const Divider(height: 32),

                  const InfoRowWidget(
                    icon: Icons.person_rounded,
                    color: Colors.indigo,
                    label: "Nama Pembuat",
                    value: "Ferry",
                  ),
                  const SizedBox(height: 16),

                  const InfoRowWidget(
                    icon: Icons.school_rounded,
                    color: Colors.teal,
                    label: "Peran / Peserta",
                    value: "Peserta Pelatihan Mobile App Development",
                  ),
                  const SizedBox(height: 16),

                  const InfoRowWidget(
                    icon: Icons.verified_rounded,
                    color: Colors.orange,
                    label: "Versi Aplikasi",
                    value: "v1.0.0 (Tugas 8)",
                  ),
                  const SizedBox(height: 16),

                  const InfoRowWidget(
                    icon: Icons.flutter_dash,
                    color: Colors.blueAccent,
                    label: "Teknologi",
                    value: "Flutter & Dart",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fitur Utama Navigasi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  FeatureItemTile(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    text: "BottomNavigationBar dengan 2 Tab (Home & Tentang)",
                  ),
                  SizedBox(height: 8),
                  FeatureItemTile(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    text: "Drawer aktif hanya pada halaman Home (Form Input)",
                  ),
                  SizedBox(height: 8),
                  FeatureItemTile(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    text: "Drawer dinonaktifkan pada halaman Tentang Aplikasi",
                  ),
                  SizedBox(height: 8),
                  FeatureItemTile(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    text: "Integrasi Form Input Tugas 7 secara interaktif",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
