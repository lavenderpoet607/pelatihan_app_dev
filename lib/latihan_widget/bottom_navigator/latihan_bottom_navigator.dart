import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/latihan_bottom_nav_enum.dart';

export 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/latihan_bottom_nav_cari.dart';
export 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/latihan_bottom_nav_enum.dart';
export 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/latihan_bottom_nav_home.dart';
export 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/latihan_bottom_nav_profil.dart';

class LatihanBottomNavigator extends StatefulWidget {
  const LatihanBottomNavigator({super.key});

  @override
  State<LatihanBottomNavigator> createState() => _LatihanBottomNavigatorState();
}

class _LatihanBottomNavigatorState extends State<LatihanBottomNavigator> {
  BottomNavTab _currentTab = BottomNavTab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Bottom Navigator: ${_currentTab.label}"),
        backgroundColor: Colors.amberAccent,
      ),
      body: IndexedStack(
        index: _currentTab.index,
        children: BottomNavTab.values.map((tab) => tab.page).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        onTap: (index) {
          setState(() {
            _currentTab = BottomNavTab.values[index];
          });
        },
        items: BottomNavTab.values.map((tab) {
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
