import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/components/tugas_8_form_input.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/components/tugas_8_tentang_aplikasi.dart';

enum Tugas8Tab {
  home(
    label: 'Home',
    appBarTitle: 'Home - Form Input',
    icon: Icons.home_rounded,
    activeIcon: Icons.home,
    view: Tugas8HomeTab(),
  ),
  tentang(
    label: 'Tentang Aplikasi',
    appBarTitle: 'Tentang Aplikasi',
    icon: Icons.info_outline_rounded,
    activeIcon: Icons.info_rounded,
    view: Tugas8TentangTab(),
  );

  final String label;
  final String appBarTitle;
  final IconData icon;
  final IconData activeIcon;
  final Widget view;

  const Tugas8Tab({
    required this.label,
    required this.appBarTitle,
    required this.icon,
    required this.activeIcon,
    required this.view,
  });
}
