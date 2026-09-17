import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/components/tugas_8_drawer.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/core/tugas_8_tab_enum.dart';

class Tugas8 extends StatefulWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const Tugas8({super.key, this.onThemeChanged, this.isDarkMode = false});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  Tugas8Tab _currentTab = Tugas8Tab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          _currentTab.appBarTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
        elevation: 1,
      ),

      drawer: _currentTab == Tugas8Tab.home
          ? Tugas8Drawer(
              onThemeChanged: widget.onThemeChanged,
              isDarkMode: widget.isDarkMode,
            )
          : null,
      body: _currentTab.view,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: const Color(0xFF0284C7),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentTab = Tugas8Tab.values[index];
          });
        },
        items: Tugas8Tab.values.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab.icon),
            activeIcon: Icon(tab.activeIcon),
            label: tab.label,
          );
        }).toList(),
      ),
    );
  }
}
