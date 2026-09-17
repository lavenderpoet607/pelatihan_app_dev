import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/components/tugas_7_kategori.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/components/tugas_7_mode_gelap.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/components/tugas_7_pengingat.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_syarat_dan_ketentuan.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/components/tugas_7_tanggal_lahir.dart';

class Tugas7Drawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  const Tugas7Drawer({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 248, 72, 160),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.menu_open, color: Colors.white, size: 40),
                SizedBox(height: 10),
                Text(
                  "Navigasi Tugas 7",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Milky Cream",
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.assignment_turned_in, color: Colors.pink),
            title: const Text("Syarat & Ketentuan"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7(
                    onThemeChanged: onThemeChanged,
                    isDarkMode: isDarkMode,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.purple),
            title: const Text("Mode Gelap"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7ModeGelap(
                    onThemeChanged: onThemeChanged,
                    isDarkMode: isDarkMode,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.category, color: Colors.deepPurple),
            title: const Text("Pilih Kategori"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7Kategori(
                    onThemeChanged: onThemeChanged,
                    isDarkMode: isDarkMode,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month, color: Colors.blue),
            title: const Text("Pilih Tanggal Lahir"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7TanggalLahir(
                    onThemeChanged: onThemeChanged,
                    isDarkMode: isDarkMode,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_time, color: Colors.orange),
            title: const Text("Atur Pengingat"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7Pengingat(
                    onThemeChanged: onThemeChanged,
                    isDarkMode: isDarkMode,
                  ),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text("Menu Utama"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
