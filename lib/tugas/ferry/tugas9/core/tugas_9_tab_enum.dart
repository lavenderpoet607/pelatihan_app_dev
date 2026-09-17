import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/components/tugas_9_tab_list.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/components/tugas_9_tab_map.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/components/tugas_9_tab_model.dart';

enum Tugas9Tab {
  list(
    label: '1. List',
    icon: Icons.format_list_bulleted,
    widget: Tugas9TabList(),
  ),
  listMap(
    label: '2. List<Map>',
    icon: Icons.dataset_outlined,
    widget: Tugas9TabMap(),
  ),
  model(
    label: '3. Model',
    icon: Icons.inventory_2_outlined,
    widget: Tugas9TabModel(),
  );

  final String label;
  final IconData icon;
  final Widget widget;

  const Tugas9Tab({
    required this.label,
    required this.icon,
    required this.widget,
  });
}
