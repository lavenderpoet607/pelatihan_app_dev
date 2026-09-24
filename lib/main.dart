import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/bottom_navigator/latihan_bottom_navigator.dart';
import 'package:pelatihan_app_dev/latihan_widget/drawer/latihan_drawer.dart';
import 'package:pelatihan_app_dev/latihan_widget/column/latihan_column.dart';
import 'package:pelatihan_app_dev/latihan_widget/listview/latihan_listview.dart';
import 'package:pelatihan_app_dev/latihan_widget/navigasi/latihan_navigasi.dart';
import 'package:pelatihan_app_dev/latihan_widget/rich_text/latihan_rich_text.dart';
import 'package:pelatihan_app_dev/latihan_widget/row/latihan_row.dart';
import 'package:pelatihan_app_dev/latihan_widget/scaffold/latihan_scaffold.dart';
import 'package:pelatihan_app_dev/latihan_widget/textfield/latihan_textfield.dart';
import 'package:pelatihan_app_dev/latihan_widget/stateful/latihan_stateful.dart';
import 'package:pelatihan_app_dev/latihan_widget/circle_avatar/latihan_widget_circle_avatar.dart';
import 'package:pelatihan_app_dev/latihan_widget/icon/latihan_widget_icon.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_shared_preferences.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/tugas_10_register_form.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas12/tugas_12_database_sqflite.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas13/tugas_13_database_sqflite.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas14/tugas_14_pokemon_api.dart';
import 'package:pelatihan_app_dev/latihan_widget/dio_public_api/latihan_dio_public_api.dart';
import 'package:pelatihan_app_dev/latihan_widget/google_maps/latihan_google_maps.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas1/tugas_1_Widget.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas3/tugas_3.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas2/tugas_2_layout.dart';
import 'package:pelatihan_app_dev/latihan_widget/single_child_scroll_view/latihan_singlechildscorollview.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas3/tugas_3_register.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas4/tugas_4_listView.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas5/tugas_5_button.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_syarat_dan_ketentuan.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/tugas_8.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9.dart';
import 'package:pelatihan_app_dev/app_route_enum.dart';
import 'package:pelatihan_app_dev/routing.dart';
import 'package:pelatihan_app_dev/penjelasan/halaman_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/halaman_katalog_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/penjelasan_data.dart';
import 'package:pelatihan_app_dev/custom_widget/halaman_custom_widget.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/halaman_latihan_login_db.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/latihan_shared_preferences.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/core/preference_handler.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/core/preference_handler.dart'
    as habibi_pref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHandler.init();
  await habibi_pref.PreferenceHandler.init();
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
      routes: AppRouting.getRoutes(
        isDarkMode: _isDarkMode,
        onThemeChanged: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
        },
      ),
    );
  }
}

class AppMenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;
  final AppRoute? route;
  final String? nomorTugas;
  final String? tag;
  final String? pembuat;

  const AppMenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
    this.route,
    this.nomorTugas,
    this.tag,
    this.pembuat,
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
  AppSection _currentSection = AppSection.latihan;

  void _navigateTo(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  void _navPushRoute(AppRoute route) {
    Navigator.pushNamed(context, route.path);
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
      route: AppRoute.latihanDrawer,
      page: LatihanDrawer(),
    ),
    AppMenuItem(
      title: 'Latihan Navigasi',
      subtitle: 'Belajar 4 metode navigasi: push, pushNamed, pushReplacement, pushAndRemoveUntil',
      icon: Icons.alt_route_rounded,
      color: Colors.deepPurple,
      route: AppRoute.latihanNavigasi,
      page: LatihanNavigasi(),
    ),
    AppMenuItem(
      title: 'Latihan TextFormField & Login DB',
      subtitle: 'Validasi form, TextFormField, dan otentikasi DBHelper',
      icon: Icons.login_rounded,
      color: Colors.blueAccent,
      route: AppRoute.latihanTextFormFieldLogin,
      page: LoginScreenDB(),
    ),
    AppMenuItem(
      title: 'Latihan SharedPreferences & ExtendedNavigator',
      subtitle: 'Session management isLogin, splash screen auto-redirect, dan ekstensi navigasi',
      icon: Icons.storage_rounded,
      color: Colors.indigo,
      route: AppRoute.latihanSharedPrefSession,
      page: LatihanSharedPreferencesSession(),
    ),
    AppMenuItem(
      title: 'Latihan Public API (Dio)',
      subtitle: 'Permintaan data HTTP GET, Dio Client, dan FutureBuilder',
      icon: Icons.cloud_sync_rounded,
      color: Colors.blueAccent,
      route: AppRoute.latihanPublicApiDio,
      page: LatihanDioPublicApi(),
    ),
    AppMenuItem(
      title: 'Latihan Google Maps',
      subtitle: 'GoogleMap, Markers, Kontrol Kamera, dan Tipe Layer Peta',
      icon: Icons.map_rounded,
      color: Color(0xFF0F766E),
      route: AppRoute.latihanGoogleMaps,
      page: LatihanGoogleMaps(),
    ),
  ];

  List<AppMenuItem> get _tugasItems => <AppMenuItem>[
    const AppMenuItem(
      title: 'Tugas 1: Profil Saya',
      subtitle: 'Biodata diri, foto profil, dan info kontak',
      icon: Icons.person_rounded,
      color: Color(0xFF6366F1),
      nomorTugas: '01',
      tag: 'Profil Diri',
      pembuat: 'Hardi',
      page: Tugas1Widget(),
    ),
    const AppMenuItem(
      title: 'Tugas 2: Layout Flutter Detail Toko',
      subtitle: 'Harumony Mystic Emporium - Toko buku',
      icon: Icons.storefront_rounded,
      color: Color(0xFFEC4899),
      nomorTugas: '02',
      tag: 'Detail Toko',
      pembuat: 'Hardi',
      page: Tugas2Layout(),
    ),
    const AppMenuItem(
      title: 'Tugas 3: Luminous News',
      subtitle: 'Portal artikel & berita masa depan',
      icon: Icons.newspaper_rounded,
      color: Color(0xFF06B6D4),
      nomorTugas: '03',
      tag: 'Luminous News',
      pembuat: 'Ferry',
      page: Tugas3Lumi(),
    ),
    const AppMenuItem(
      title: 'Tugas 3: Form Input & Penataan Grid',
      subtitle: 'Layouting Lanjutan',
      icon: Icons.input_rounded,
      color: Color(0xFFF97316),
      nomorTugas: '03',
      tag: 'Form & Grid',
      pembuat: 'Hardi',
      page: Tugas3(),
    ),
    const AppMenuItem(
      title: 'Tugas 4: ListView & ListTile',
      subtitle: 'Optimalisasi Daftar dengan ListView & ListTile',
      icon: Icons.view_list_rounded,
      color: Color(0xFF10B981),
      nomorTugas: '04',
      tag: 'ListView',
      pembuat: 'Hardi',
      page: Tugas4(),
    ),
    const AppMenuItem(
      title: 'Tugas 5: Event Handling',
      subtitle: 'Interaksi Pengguna & Event Handling',
      icon: Icons.event_rounded,
      color: Color(0xFFF59E0B),
      nomorTugas: '05',
      tag: 'Event Handling',
      pembuat: 'Ferry',
      page: Tugas5(),
    ),
    AppMenuItem(
      title: 'Tugas 7: Form Input',
      subtitle: 'Interaktif dengan Navigasi Drawer',
      icon: Icons.text_format_rounded,
      color: const Color(0xFFE11D48),
      nomorTugas: '07',
      tag: 'Form & Drawer',
      pembuat: 'Hardi',
      route: AppRoute.tugas7,
      page: Tugas7(
        onThemeChanged: widget.onThemeChanged,
        isDarkMode: widget.isDarkMode,
      ),
    ),
    AppMenuItem(
      title: 'Tugas 8: Navigasi Bawah (Bottom Nav)',
      subtitle: 'BottomNavigationBar & Conditional Drawer (Ridho)',
      icon: Icons.tab_rounded,
      color: const Color(0xFF0284C7),
      nomorTugas: '08',
      tag: 'Bottom Nav',
      pembuat: 'Ferry',
      route: AppRoute.tugas8,
      page: Tugas8(
        onThemeChanged: widget.onThemeChanged,
        isDarkMode: widget.isDarkMode,
      ),
    ),
    const AppMenuItem(
      title: 'Tugas 9: Daftar Kategori',
      subtitle: 'ListView.builder: List, Map, dan Model',
      icon: Icons.list_alt_rounded,
      color: Color(0xFF059669),
      nomorTugas: '09',
      tag: 'ListView Model',
      pembuat: 'Ferry',
      route: AppRoute.tugas9,
      page: Tugas9(),
    ),
    const AppMenuItem(
      title: 'Tugas 10: Formulir Pendaftaran',
      subtitle: 'Validasi form, AlertDialog ringkasan & halaman konfirmasi',
      icon: Icons.app_registration_rounded,
      color: Color(0xFF2563EB),
      nomorTugas: '10',
      tag: 'Form Validation',
      pembuat: 'Hardi',
      route: AppRoute.tugas10,
      page: Tugas10(),
    ),
    const AppMenuItem(
      title: 'Tugas 11: Shared Preferences',
      subtitle: 'Implementasi Sesi Pengguna (Shared Preferences)',
      icon: Icons.lock,
      color: Color(0xFF7C3AED),
      nomorTugas: '11',
      tag: 'Shared Pref',
      pembuat: 'Habibi',
      route: AppRoute.tugas11,
      page: Tugas11(),
    ),
    const AppMenuItem(
      title: 'Tugas 12: Database SQFLite',
      subtitle: 'Pendaftaran Peserta & Database Lokal SQFLite (CRUD)',
      icon: Icons.storage_rounded,
      color: Color(0xFF0D9488),
      nomorTugas: '12',
      tag: 'SQLite CRUD',
      pembuat: 'Hardi',
      route: AppRoute.tugas12,
      page: Tugas12(),
    ),
    const AppMenuItem(
      title: 'Tugas 13: SQFLite CRUD Lengkap',
      subtitle: 'Update, Delete, Dialog Konfirmasi & SnackBar Feedback',
      icon: Icons.manage_accounts_rounded,
      color: Color(0xFF0F766E),
      nomorTugas: '13',
      tag: 'Update & Delete',
      pembuat: 'Hardi',
      route: AppRoute.tugas13,
      page: Tugas13(),
    ),
    const AppMenuItem(
      title: 'Tugas 14: Integrasi Public API',
      subtitle: 'PokeAPI v2, Parsing JSON, Dio Client & Detail Pokemon',
      icon: Icons.catching_pokemon_rounded,
      color: Color(0xFFDC2626),
      nomorTugas: '14',
      tag: 'Public API',
      pembuat: 'Hardi',
      route: AppRoute.tugas14,
      page: Tugas14(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTitle = _currentSection.title;

    return Scaffold(
      appBar: _currentSection == AppSection.customStudio
          ? null
          : AppBar(
              title: Text(
                currentTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 0.5,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.menu_book_rounded,
                    color: Colors.indigo,
                  ),
                  tooltip: 'Buku Penjelasan & Kode',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HalamanKatalogPenjelasan(),
                      ),
                    );
                  },
                ),
              ],
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
            ListTile(
              leading: const Icon(
                Icons.menu_book_rounded,
                color: Colors.indigo,
              ),
              title: const Text(
                'Buku Penjelasan & Kode',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Rangkuman teori & potongan kode 22 materi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HalamanKatalogPenjelasan(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.tune_rounded, color: Colors.indigo),
              title: const Text(
                'Custom Widget Studio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Rancang widget & fungsi interaktif otomatis',
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentSection = AppSection.customStudio;
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.devices_rounded,
                color: Colors.deepPurple,
              ),
              title: const Text(
                'Custom UI Screen Studio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Simulator layar utuh & generator UI interaktif',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoute.customUi.path);
              },
            ),
            const Divider(),
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
                  if (item.route != null) {
                    _navPushRoute(item.route!);
                  } else {
                    _navigateTo(item.page);
                  }
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
                leading: CircleAvatar(
                  radius: 14,
                  backgroundColor: item.color.withAlpha(30),
                  child: Text(
                    item.nomorTugas ?? 'T',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: item.color,
                    ),
                  ),
                ),
                title: Text(item.title),
                dense: true,
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 12),
                onTap: () {
                  Navigator.pop(context);
                  if (item.route != null) {
                    _navPushRoute(item.route!);
                  } else {
                    _navigateTo(item.page);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      body: _currentSection == AppSection.customStudio
          ? const HalamanCustomWidget()
          : _currentSection == AppSection.tugas
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _tugasItems.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildTugasHeader();
                }
                final item = _tugasItems[index - 1];
                return _buildTugasCard(item);
              },
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _latihanItems.length,
              itemBuilder: (context, index) {
                final item = _latihanItems[index];
                return _buildMenuItemCard(item);
              },
            ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentSection.index,
        onDestinationSelected: (index) {
          setState(() {
            _currentSection = AppSection.values[index];
          });
        },
        destinations: AppSection.values
            .map(
              (section) => NavigationDestination(
                icon: Icon(section.icon),
                selectedIcon: Icon(section.selectedIcon),
                label: section.navLabel,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTugasHeader() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withAlpha(40),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.tealAccent.withAlpha(35),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.tealAccent.withAlpha(90)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.assignment_turned_in_rounded,
                      size: 14,
                      color: Colors.tealAccent,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'TUGAS MANDIRI',
                      style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${_tugasItems.length} Tugas',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Koleksi Tugas Mandiri Flutter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Rangkaian tugas mulai dari perancangan UI dasar, navigasi, interaksi formulir, hingga persistensi data lokal SQLite.',
            style: TextStyle(
              color: Colors.white.withAlpha(200),
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTugasCard(AppMenuItem item) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: item.color.withAlpha(60), width: 1.2),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          if (item.route != null) {
            _navPushRoute(item.route!);
          } else {
            _navigateTo(item.page);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: item.color.withAlpha(25),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: item.color.withAlpha(80)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.task_alt_rounded,
                          size: 13,
                          color: item.color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'TUGAS ${item.nomorTugas ?? ""}',
                          style: TextStyle(
                            color: item.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (item.tag != null) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        item.tag!,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (item.pembuat != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: item.color.withAlpha(20),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item.pembuat!,
                        style: TextStyle(
                          color: item.color,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  IconButton(
                    icon: Icon(
                      Icons.menu_book_rounded,
                      color: item.color,
                      size: 20,
                    ),
                    tooltip: 'Penjelasan & Potongan Kode',
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.only(left: 6),
                    onPressed: () {
                      final penjelasan =
                          cariPenjelasanItem(item.title) ??
                          cariPenjelasanItem(
                            item.title.replaceFirst(
                              RegExp(r'^Tugas\s*\d+\s*(\([A-Za-z0-9]+\))?:\s*'),
                              'Tugas: ',
                            ),
                          );
                      if (penjelasan != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HalamanPenjelasan(item: penjelasan),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: item.color.withAlpha(25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(item.icon, color: item.color, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          item.subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: item.color.withAlpha(12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Buka Halaman Tugas',
                      style: TextStyle(
                        color: item.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 14,
                      color: item.color,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
          if (item.route != null) {
            _navPushRoute(item.route!);
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
              IconButton(
                icon: Icon(
                  Icons.menu_book_rounded,
                  color: item.color,
                  size: 22,
                ),
                tooltip: 'Penjelasan & Potongan Kode',
                onPressed: () {
                  final penjelasan = cariPenjelasanItem(item.title);
                  if (penjelasan != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HalamanPenjelasan(item: penjelasan),
                      ),
                    );
                  }
                },
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
}
