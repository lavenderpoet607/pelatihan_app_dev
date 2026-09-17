import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/drawer/latihan_drawer_enum.dart';
import 'package:pelatihan_app_dev/latihan_widget/drawer/latihan_drawer_menu.dart';

export 'package:pelatihan_app_dev/latihan_widget/drawer/latihan_drawer_enum.dart';
export 'package:pelatihan_app_dev/latihan_widget/drawer/latihan_drawer_menu.dart';

class LatihanDrawer extends StatefulWidget {
  const LatihanDrawer({super.key});

  @override
  State<LatihanDrawer> createState() => _LatihanDrawerState();
}

class _LatihanDrawerState extends State<LatihanDrawer> {
  LatihanDrawerPage _currentPage = LatihanDrawerPage.avatar;

  void _onPageSelected(LatihanDrawerPage page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPage.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: LatihanDrawerMenu(
        selectedPage: _currentPage,
        onPageSelected: _onPageSelected,
      ),
      body: _currentPage.page,
    );
  }
}
