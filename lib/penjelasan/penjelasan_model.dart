import 'package:flutter/material.dart';

class PenjelasanItem {
  final String title;
  final String subtitle;
  final String kategori;
  final IconData icon;
  final Color color;
  final String deskripsi;
  final List<String> poinPenting;
  final String cropKode;
  final Widget halaman;

  const PenjelasanItem({
    required this.title,
    required this.subtitle,
    required this.kategori,
    required this.icon,
    required this.color,
    required this.deskripsi,
    required this.poinPenting,
    required this.cropKode,
    required this.halaman,
  });
}
