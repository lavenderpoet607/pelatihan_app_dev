import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/circle_avatar/latihan_circleavatar.dart';
import 'package:pelatihan_app_dev/latihan_widget/gridview/latihan_gridview.dart';

enum LatihanDrawerPage {
  avatar(
    title: 'Halaman Circle Avatar',
    menuTitle: 'Latihan Icon Avatar',
    icon: Icons.home,
    page: LatihanCircleavatar(),
  ),
  grid(
    title: 'Halaman Grid view',
    menuTitle: 'Latihan Grid View',
    icon: Icons.grid_view,
    page: LatihanGridview(),
  );

  final String title;
  final String menuTitle;
  final IconData icon;
  final Widget page;

  const LatihanDrawerPage({
    required this.title,
    required this.menuTitle,
    required this.icon,
    required this.page,
  });
}
