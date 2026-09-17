import 'package:flutter/material.dart';

enum MetodeNavigasi {
  push(
    nama: 'push',
    penjelasan: 'Menumpuk halaman baru di atas halaman saat ini (halaman sebelumnya tetap ada di stack)',
    color: Colors.blue,
    icon: Icons.arrow_forward,
  ),
  pushNamed(
    nama: 'pushNamed',
    penjelasan: 'Membuka halaman berdasarkan nama rute yang telah didaftarkan pada routes MaterialApp',
    color: Colors.indigo,
    icon: Icons.link,
  ),
  pushReplacement(
    nama: 'pushReplacement',
    penjelasan: 'Menggantikan halaman saat ini dengan halaman baru (halaman saat ini dihapus dari stack)',
    color: Colors.teal,
    icon: Icons.swap_horiz,
  ),
  pushAndRemoveUntil(
    nama: 'pushAndRemoveUntil',
    penjelasan:
        'Menghapus semua tumpukan halaman sebelumnya dan membuka halaman baru',
    color: Colors.deepOrange,
    icon: Icons.clear_all,
  );

  final String nama;
  final String penjelasan;
  final Color color;
  final IconData icon;

  const MetodeNavigasi({
    required this.nama,
    required this.penjelasan,
    required this.color,
    required this.icon,
  });
}
