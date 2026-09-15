import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/app_route_enum.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_kategori.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_mode_gelap.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_pengingat.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_syarat_dan_ketentuan.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_tanggal_lahir.dart';

enum Tugas8DrawerItem {
  syaratKetentuan(
    title: 'Syarat & Ketentuan (Tugas 7)',
    icon: Icons.description,
    color: Colors.blue,
  ),
  kategori(
    title: 'Pilih Kategori',
    icon: Icons.category,
    color: Colors.deepPurple,
  ),
  tanggalLahir(
    title: 'Pilih Tanggal Lahir',
    icon: Icons.calendar_month,
    color: Colors.teal,
  ),
  pengingat(
    title: 'Atur Pengingat',
    icon: Icons.access_time,
    color: Colors.orange,
  ),
  modeGelap(title: 'Mode Gelap', icon: Icons.dark_mode, color: Colors.indigo);

  final String title;
  final IconData icon;
  final Color color;

  const Tugas8DrawerItem({
    required this.title,
    required this.icon,
    required this.color,
  });
}

class Tugas8Drawer extends StatelessWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const Tugas8Drawer({super.key, this.onThemeChanged, this.isDarkMode = false});

  Widget _getPageFor(Tugas8DrawerItem item) {
    switch (item) {
      case Tugas8DrawerItem.syaratKetentuan:
        return Tugas7(
          onThemeChanged: onThemeChanged ?? (_) {},
          isDarkMode: isDarkMode,
        );
      case Tugas8DrawerItem.kategori:
        return Tugas7Kategori(
          onThemeChanged: onThemeChanged ?? (_) {},
          isDarkMode: isDarkMode,
        );
      case Tugas8DrawerItem.tanggalLahir:
        return Tugas7TanggalLahir(
          onThemeChanged: onThemeChanged ?? (_) {},
          isDarkMode: isDarkMode,
        );
      case Tugas8DrawerItem.pengingat:
        return Tugas7Pengingat(
          onThemeChanged: onThemeChanged ?? (_) {},
          isDarkMode: isDarkMode,
        );
      case Tugas8DrawerItem.modeGelap:
        return Tugas7ModeGelap(
          onThemeChanged: onThemeChanged ?? (_) {},
          isDarkMode: isDarkMode,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0284C7), Color(0xFF38BDF8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text(
              "Ferry (Tugas 8)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text("ferry.developer@pelatihan.dev"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "F",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0284C7),
                ),
              ),
            ),
          ),
          ...Tugas8DrawerItem.values.map(
            (item) => ListTile(
              leading: Icon(item.icon, color: item.color),
              title: Text(item.title),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => _getPageFor(item)),
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.black87),
            title: const Text("Kembali ke Menu Utama"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoute.home.path,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
