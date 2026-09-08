import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_column.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_listview.dart';
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
import 'package:pelatihan_app_dev/tugas/hardi/tugas_4_ListView.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas_5_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MultiWidgetApp(),
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
  const MultiWidgetApp({super.key});

  @override
  State<MultiWidgetApp> createState() => _MultiWidgetAppState();
}

class _MultiWidgetAppState extends State<MultiWidgetApp> {
  int _currentIndex = 0;

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
  ];

  static const List<AppMenuItem> _tugasItems = [
    AppMenuItem(
      title: 'Tugas: Profil Saya',
      subtitle: 'Biodata diri, foto profil, dan info kontak',
      icon: Icons.person_rounded,
      color: Color(0xFF6366F1), // Indigo
      page: Tugas1Widget(),
    ),
    AppMenuItem(
      title: 'Tugas: Layout Flutter Detail Toko',
      subtitle: 'Harumony Mystic Emporium - Toko buku',
      icon: Icons.storefront_rounded,
      color: Color(0xFFEC4899), // Pink
      page: Tugas2Layout(),
    ),
    AppMenuItem(
      title: 'Tugas: Luminous News',
      subtitle: 'Portal artikel & berita masa depan',
      icon: Icons.newspaper_rounded,
      color: Color(0xFF06B6D4), // Cyan
      page: Tugas3Lumi(),
    ),
    AppMenuItem(
      title: 'Tugas: Form Input & Penataan Grid',
      subtitle: 'Layouting Lanjutan',
      icon: Icons.input_rounded,
      color: Color(0xFFF97316), // Orange
      page: Tugas3(),
    ),
    AppMenuItem(
      title: 'Tugas: ListView & ListTile',
      subtitle: 'Optimalisasi Daftar dengan ListView & ListTile',
      icon: Icons.view_list_rounded,
      color: Color(0xFF10B981), // Emerald
      page: Tugas4(),
    ),
    AppMenuItem(
      title: 'Tugas: Event Handling',
      subtitle: 'Interaksi Pengguna & Event Handling',
      icon: Icons.event_rounded,
      color: Color(0xFFF59E0B), // Amber
      page: Tugas5(),
    ),
  ];

  void _navigateTo(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final currentList = _currentIndex == 0 ? _latihanItems : _tugasItems;
    final currentTitle = _currentIndex == 0
        ? 'Latihan Widget'
        : 'Tugas Mandiri';

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
                  _navigateTo(item.page);
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
              onTap: () => _navigateTo(item.page),
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
}
