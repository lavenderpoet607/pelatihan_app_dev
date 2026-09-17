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
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/tugas_10_register_form.dart';
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
import 'package:pelatihan_app_dev/penjelasan/halaman_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/halaman_katalog_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/penjelasan_data.dart';
import 'package:pelatihan_app_dev/custom_widget/halaman_custom_widget.dart';
import 'package:pelatihan_app_dev/custom_ui/halaman_custom_ui_studio.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/halaman_latihan_login_db.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/latihan_shared_preferences.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_splash_session.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/preference_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHandler.init();
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
        AppRoute.home.path: (context) => MultiWidgetApp(
          isDarkMode: _isDarkMode,
          onThemeChanged: (bool value) {
            setState(() {
              _isDarkMode = value;
            });
          },
        ),
        AppRoute.latihanNavigasi.path: (context) => const LatihanNavigasi(),
        AppRoute.latihanDrawer.path: (context) => const LatihanDrawer(),
        AppRoute.tujuanNavigasi.path: (context) =>
            const HalamanTujuanNavigasi(metode: MetodeNavigasi.pushNamed),
        AppRoute.tugas7.path: (context) => Tugas7(
          isDarkMode: _isDarkMode,
          onThemeChanged: (bool value) {
            setState(() {
              _isDarkMode = value;
            });
          },
        ),
        AppRoute.tugas8.path: (context) => Tugas8(
          isDarkMode: _isDarkMode,
          onThemeChanged: (bool value) {
            setState(() {
              _isDarkMode = value;
            });
          },
        ),
        AppRoute.tugas9.path: (context) => const Tugas9(),
        AppRoute.tugas10.path: (context) => const Tugas10(),
        AppRoute.customWidget.path: (context) => const HalamanCustomWidget(),
        AppRoute.customUi.path: (context) => const HalamanCustomUiStudio(),
        AppRoute.latihanTextFormFieldLogin.path: (context) =>
            const LoginScreenDB(),
        AppRoute.latihanSharedPrefSession.path: (context) =>
            const SplashScreenDay15(),
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
  final AppRoute? route;

  const AppMenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
    this.route,
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
      route: AppRoute.tugas7,
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
      route: AppRoute.tugas8,
      page: Tugas8(
        onThemeChanged: widget.onThemeChanged,
        isDarkMode: widget.isDarkMode,
      ),
    ),
    AppMenuItem(
      title: 'Tugas: Daftar Kategori',
      subtitle: 'ListView.builder: List, Map, dan Model',
      icon: Icons.list_alt_rounded,
      color: Color(0xFF10B981),
      route: AppRoute.tugas9,
      page: Tugas9(),
    ),
    const AppMenuItem(
      title: 'Tugas: Formulir Pendaftaran',
      subtitle: 'Validasi form, AlertDialog ringkasan & halaman konfirmasi',
      icon: Icons.app_registration_rounded,
      color: Color(0xFF2563EB),
      route: AppRoute.tugas10,
      page: Tugas10(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentList = _currentSection == AppSection.latihan
        ? _latihanItems
        : _tugasItems;
    final currentTitle = _currentSection.title;

    final _ = Tugas7(
      onThemeChanged: widget.onThemeChanged,
      isDarkMode: widget.isDarkMode,
    );

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
          ],
        ),
      ),
      body: _currentSection == AppSection.customStudio
          ? const HalamanCustomWidget()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: currentList.length,
              itemBuilder: (context, index) {
                final item = currentList[index];
                if (_currentSection == AppSection.latihan && index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [_buildMenuItemCard(item)],
                  );
                }

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
