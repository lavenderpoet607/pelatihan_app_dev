import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_circleavatar.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_gridview.dart';

class LatihanDrawer extends StatefulWidget {
  const LatihanDrawer({super.key});

  @override
  State<LatihanDrawer> createState() => _LatihanDrawerState();
}

class _LatihanDrawerState extends State<LatihanDrawer> {
  // Indeks halaman aktif saat ini
  int _selectedIndex = 0;

  // Daftar judul untuk AppBar berdasarkan halaman aktif
  final List<String> _titles = ['Halaman Circle Avatar', 'Halaman Grid view'];

  // Daftar widget halaman tujuan
  final List<Widget> _pages = [
    const LatihanCircleavatar(),
    const LatihanGridview(),
  ];

  // Fungsi untuk mengubah halaman aktif
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
      ), // AppBar
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
                ), // Text
              ), // CircleAvatar
              decoration: BoxDecoration(color: Colors.blue),
            ), // UserAccountsDrawerHeader
            // Menu 1: Beranda
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Latihan Icon Avatar'),
              selected: _selectedIndex == 0, // Highlight jika menu ini aktif
              onTap: () {
                _onItemTapped(0); // Pindah ke indeks 0
                Navigator.pop(context); // Menutup Drawer setelah diklik
              },
            ), // ListTile
            // Menu 2: Pengaturan
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Latihan Grid View'),
              selected: _selectedIndex == 1, // Highlight jika menu ini aktif
              onTap: () {
                _onItemTapped(1); // Pindah ke indeks 1
                Navigator.pop(context); // Menutup Drawer setelah diklik
              },
            ), // ListTile
          ],
        ), // ListView
      ), // Drawer
      body: _pages[_selectedIndex],
    ); // Scaffold
  }
}
