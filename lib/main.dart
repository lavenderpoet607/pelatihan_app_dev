import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_bottom_navigator.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_drawer.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_column.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_listview.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_navigasi.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_rich_text.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_row.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_scaffold.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_textfield.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_stateful.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_widget_circle_avatar.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_widget_icon.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas_1_Widget.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas_3.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas_2_layout.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_singlechildscorollview.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas_3_register.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas_4_listView.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas_5_button.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_syarat_dan_ketentuan.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas_8.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas_9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelatihan App Dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF6F8FA),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MultiWidgetApp(
        isDarkMode: _isDarkMode,
        onThemeChanged: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
        },
      ),
      routes: {
        '/home': (context) => MultiWidgetApp(
          isDarkMode: _isDarkMode,
          onThemeChanged: (bool value) {
            setState(() {
              _isDarkMode = value;
            });
          },
        ),
        '/latihan_navigasi': (context) => const LatihanNavigasi(),
        '/latihan_drawer': (context) => const LatihanDrawer(),
        '/tujuan_navigasi': (context) =>
            const HalamanTujuanNavigasi(metode: 'pushNamed'),
        '/tugas7': (context) => Tugas7(
          isDarkMode: _isDarkMode,
          onThemeChanged: (bool value) {
            setState(() {
              _isDarkMode = value;
            });
          },
        ),
        '/tugas8': (context) => Tugas8(
          isDarkMode: _isDarkMode,
          onThemeChanged: (bool value) {
            setState(() {
              _isDarkMode = value;
            });
          },
        ),
        '/tugas9': (context) => const Tugas9(),
      },
    );
  }
}

class AppMenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  const AppMenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
  });
}

class MultiWidgetApp extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const MultiWidgetApp({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<MultiWidgetApp> createState() => _MultiWidgetAppState();
}

class _MultiWidgetAppState extends State<MultiWidgetApp> {
  int _currentIndex = 0;

  void _navigateTo(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  void _navPushNamed(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  void _navPushReplacement(Widget page) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  void _navPushAndRemoveUntil(Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  static const List<AppMenuItem> _latihanItems = [
    AppMenuItem(
      title: 'Latihan Scaffold',
      subtitle: 'Belajar struktur dasar halaman dan body',
      icon: Icons.view_quilt_rounded,
      color: Colors.blue,
      page: LatihanScaffold(),
    ),
    AppMenuItem(
      title: 'Latihan Column',
      subtitle: 'Menyusun widget secara vertikal',
      icon: Icons.view_column_rounded,
      color: Colors.indigo,
      page: LatihanColumn(),
    ),
    AppMenuItem(
      title: 'Latihan Row',
      subtitle: 'Menyusun widget secara horizontal',
      icon: Icons.view_stream_rounded,
      color: Colors.teal,
      page: LatihanRow(),
    ),
    AppMenuItem(
      title: 'Latihan RichText',
      subtitle: 'Kustomisasi format dan warna teks',
      icon: Icons.text_fields_rounded,
      color: Colors.deepOrange,
      page: LatihanRichText(),
    ),
    AppMenuItem(
      title: 'Latihan Icon',
      subtitle: 'Menampilkan berbagai macam ikon',
      icon: Icons.emoji_symbols_rounded,
      color: Colors.pink,
      page: LatihanWidgetIcon(),
    ),
    AppMenuItem(
      title: 'Latihan CircleAvatar',
      subtitle: 'Menampilkan avatar profil melingkar',
      icon: Icons.account_circle_rounded,
      color: Colors.purple,
      page: LatihanWidgetCircleAvatar(),
    ),
    AppMenuItem(
      title: 'Latihan Single Child Scroll View',
      subtitle: 'Mengubah agar halaman bisa menjadi scrollable',
      icon: Icons.child_care_outlined,
      color: Color.fromARGB(255, 255, 0, 0),
      page: LatihanSinglechildscorollview(),
    ),
    AppMenuItem(
      title: 'Latihan List View',
      subtitle: 'Menjadikan Subjek menjadi list dalam view',
      icon: Icons.line_style,
      color: Color.fromARGB(255, 74, 145, 238),
      page: LatihanListview(),
    ),
    AppMenuItem(
      title: 'Latihan TextField',
      subtitle: 'Menjadikan Subjek menjadi text yang bisa di input',
      icon: Icons.text_fields,
      color: Color.fromARGB(255, 74, 145, 238),
      page: LatihanTextfield(),
    ),
    AppMenuItem(
      title: 'Latihan StatefulWidget',
      subtitle: 'Belajar manajemen state dinamis & counter',
      icon: Icons.touch_app_rounded,
      color: Colors.blueAccent,
      page: LatihanStateful(),
    ),
    AppMenuItem(
      title: 'Latihan Bottom Navigator',
      subtitle: 'Belajar Bottom Navigator',
      icon: Icons.navigation,
      color: Colors.deepPurple,
      page: LatihanBottomNavigator(),
    ),
    AppMenuItem(
      title: 'Latihan Drawer',
      subtitle: 'Belajar navigasi drawer dengan UserAccountsDrawerHeader',
      icon: Icons.menu_open_rounded,
      color: Colors.blue,
      page: LatihanDrawer(),
    ),
    AppMenuItem(
      title: 'Latihan Navigasi',
      subtitle: 'Belajar 4 metode navigasi: push, pushNamed, pushReplacement, pushAndRemoveUntil',
      icon: Icons.alt_route_rounded,
      color: Colors.deepPurple,
      page: LatihanNavigasi(),
    ),
  ];

  List<AppMenuItem> get _tugasItems => <AppMenuItem>[
    const AppMenuItem(
      title: 'Tugas: Profil Saya',
      subtitle: 'Biodata diri, foto profil, dan info kontak',
      icon: Icons.person_rounded,
      color: Color(0xFF6366F1),
      page: Tugas1Widget(),
    ),
    const AppMenuItem(
      title: 'Tugas: Layout Flutter Detail Toko',
      subtitle: 'Harumony Mystic Emporium - Toko buku',
      icon: Icons.storefront_rounded,
      color: Color(0xFFEC4899),
      page: Tugas2Layout(),
    ),
    const AppMenuItem(
      title: 'Tugas: Luminous News',
      subtitle: 'Portal artikel & berita masa depan',
      icon: Icons.newspaper_rounded,
      color: Color(0xFF06B6D4),
      page: Tugas3Lumi(),
    ),
    const AppMenuItem(
      title: 'Tugas: Form Input & Penataan Grid',
      subtitle: 'Layouting Lanjutan',
      icon: Icons.input_rounded,
      color: Color(0xFFF97316),
      page: Tugas3(),
    ),
    const AppMenuItem(
      title: 'Tugas: ListView & ListTile',
      subtitle: 'Optimalisasi Daftar dengan ListView & ListTile',
      icon: Icons.view_list_rounded,
      color: Color(0xFF10B981),
      page: Tugas4(),
    ),
    const AppMenuItem(
      title: 'Tugas: Event Handling',
      subtitle: 'Interaksi Pengguna & Event Handling',
      icon: Icons.event_rounded,
      color: Color(0xFFF59E0B),
      page: Tugas5(),
    ),
    AppMenuItem(
      title: 'Tugas: Form Input',
      subtitle: 'Interaktif dengan Navigasi Drawer',
      icon: Icons.text_format_rounded,
      color: const Color(0xFFF59E0B),
      page: Tugas7(
        onThemeChanged: widget.onThemeChanged,
        isDarkMode: widget.isDarkMode,
      ),
    ),
    AppMenuItem(
      title: 'Tugas: Navigasi Bawah (Bottom Nav)',
      subtitle: 'BottomNavigationBar & Conditional Drawer (Ridho)',
      icon: Icons.tab_rounded,
      color: const Color(0xFF0284C7),
      page: Tugas8(
        onThemeChanged: widget.onThemeChanged,
        isDarkMode: widget.isDarkMode,
      ),
    ),
    const AppMenuItem(
      title: 'Tugas: Daftar Kategori',
      subtitle: 'ListView.builder: List, Map, dan Model',
      icon: Icons.list_alt_rounded,
      color: Color(0xFF10B981),
      page: Tugas9(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentList = _currentIndex == 0 ? _latihanItems : _tugasItems;
    final currentTitle = _currentIndex == 0
        ? 'Latihan Widget'
        : 'Tugas Mandiri';

    final tugas7Page = Tugas7(
      onThemeChanged: widget.onThemeChanged,
      isDarkMode: widget.isDarkMode,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.code_rounded,
                      size: 32,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pelatihan App Dev',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Kumpulan Latihan & Tugas',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                'LATIHAN WIDGET',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
            ),
            ..._latihanItems.map(
              (item) => ListTile(
                leading: Icon(item.icon, color: item.color),
                title: Text(item.title),
                dense: true,
                onTap: () {
                  Navigator.pop(context);
                  _navigateTo(item.page);
                },
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                'TUGAS MANDIRI',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
            ),
            ..._tugasItems.map(
              (item) => ListTile(
                leading: Icon(item.icon, color: item.color),
                title: Text(item.title),
                dense: true,
                onTap: () {
                  Navigator.pop(context);
                  if (item.title == 'Tugas: Form Input') {
                    _navPushNamed('/tugas7');
                  } else {
                    _navigateTo(item.page);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: currentList.length,
        itemBuilder: (context, index) {
          final item = currentList[index];
          if (_currentIndex == 0 && index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildNavigationDemoCard(tugas7Page),
                _buildMenuItemCard(item),
              ],
            );
          }

          return _buildMenuItemCard(item);
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets_rounded),
            label: 'Latihan Widget',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment_rounded),
            label: 'Tugas',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItemCard(AppMenuItem item) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          if (item.title == 'Tugas: Form Input') {
            _navPushNamed('/tugas7');
          } else {
            _navigateTo(item.page);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: item.color.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: item.color, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationDemoCard(Widget tugas7Page) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blue.shade100, width: 1.5),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.alt_route_rounded,
                    color: Colors.blueAccent,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4 Metode Navigasi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Uji navigasi ke Tugas 7 dalam satu halaman',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
              onPressed: () => _navigateTo(tugas7Page),
              icon: const Icon(Icons.arrow_forward, size: 16),
              label: const Text('push', style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _navPushNamed('/tugas7'),
              icon: const Icon(Icons.link, size: 16),
              label: const Text('pushNamed', style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _navPushReplacement(tugas7Page),
              icon: const Icon(Icons.swap_horiz, size: 16),
              label: const Text(
                'pushReplacement',
                style: TextStyle(fontSize: 11),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _navPushAndRemoveUntil(tugas7Page),
              icon: const Icon(Icons.clear_all, size: 16),
              label: const Text(
                'pushAndRemoveUntil',
                style: TextStyle(fontSize: 10),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
