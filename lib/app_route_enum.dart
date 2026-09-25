import 'package:flutter/material.dart';

enum AppRoute {
  home('/home'),
  latihanNavigasi('/latihan_navigasi'),
  latihanDrawer('/latihan_drawer'),
  tujuanNavigasi('/tujuan_navigasi'),
  tugas7('/tugas7'),
  tugas8('/tugas8'),
  tugas9('/tugas9'),
  tugas10('/tugas10'),
  tugas11('/tugas11'),
  tugas12('/tugas12'),
  tugas13('/tugas13'),
  tugas14('/tugas14'),
  tugas15('/tugas15'),
  customWidget('/custom_widget'),
  customUi('/custom_ui'),
  latihanTextFormFieldLogin('/latihan_textformfield_login'),
  latihanSharedPrefSession('/latihan_shared_pref_session'),
  latihanPublicApiDio('/latihan_public_api_dio'),
  latihanGoogleMaps('/latihan_google_maps');

  final String path;

  const AppRoute(this.path);
}

enum AppSection {
  latihan(
    title: 'Latihan Widget',
    navLabel: 'Latihan Widget',
    icon: Icons.widgets_outlined,
    selectedIcon: Icons.widgets_rounded,
  ),
  tugas(
    title: 'Tugas Mandiri',
    navLabel: 'Tugas',
    icon: Icons.assignment_outlined,
    selectedIcon: Icons.assignment_rounded,
  ),
  customStudio(
    title: 'Custom Studio',
    navLabel: 'Custom Studio',
    icon: Icons.tune_outlined,
    selectedIcon: Icons.tune_rounded,
  );

  final String title;
  final String navLabel;
  final IconData icon;
  final IconData selectedIcon;

  const AppSection({
    required this.title,
    required this.navLabel,
    required this.icon,
    required this.selectedIcon,
  });
}
