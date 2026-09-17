import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/components/latihan_bottom_nav_cari.dart';
import 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/components/latihan_bottom_nav_home.dart';
import 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/components/latihan_bottom_nav_profil.dart';

enum BottomNavTab {
  home(
    label: 'Home',
    icon: Icons.home,
    activeIcon: Icons.home_filled,
    page: LatihanBottomNavHome(),
  ),
  cari(
    label: 'Cari',
    icon: Icons.search,
    activeIcon: Icons.search_rounded,
    page: LatihanBottomNavCari(),
  ),
  profil(
    label: 'Profil',
    icon: Icons.person_outline,
    activeIcon: Icons.person,
    page: LatihanBottomNavProfil(),
  );

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final Widget page;

  const BottomNavTab({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.page,
  });
}
