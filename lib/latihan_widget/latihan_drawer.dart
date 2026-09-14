import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_circleavatar.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_gridview.dart';

class LatihanDrawer extends StatefulWidget {
  const LatihanDrawer({super.key});

  @override
  State<LatihanDrawer> createState() => _LatihanDrawerState();
}

class _LatihanDrawerState extends State<LatihanDrawer> {
  int _selectedIndex = 0;

  final List<String> _titles = ['Halaman Circle Avatar', 'Halaman Grid view'];

  final List<Widget> _pages = [
    const LatihanCircleavatar(),
    const LatihanGridview(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Budi Setiawan"),
              accountEmail: Text("budi.setiawan@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "B",
                  style: TextStyle(fontSize: 40.0, color: Colors.blue),
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Latihan Icon Avatar'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Latihan Grid View'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
