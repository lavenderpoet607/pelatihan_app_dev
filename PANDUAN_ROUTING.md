# Panduan Lengkap Rute & Routing (Sesuai Kode Asli Proyek)

Dokumen ini berisi potongan (_crop_) lengkap kode asli proyek Anda di [`lib/routes.dart`](file:///d:/pelatihan/project/pelatihan_app_dev/lib/routes.dart), [`lib/routing.dart`](file:///d:/pelatihan/project/pelatihan_app_dev/lib/routing.dart), dan **SELURUH ISI** [`lib/main.dart`](file:///d:/pelatihan/project/pelatihan_app_dev/lib/main.dart) beserta penjelasan baris per barisnya.

---

## 1. Crop Kode Asli: `lib/routes.dart`

File [`lib/routes.dart`](file:///d:/pelatihan/project/pelatihan_app_dev/lib/routes.dart) berfungsi sebagai **Katalog Alamat Rute**:

```dart
class AppRoutes {
  // Rute default awal aplikasi
  static const String initial = '/';

  // Rute menu utama (MultiWidgetApp)
  static const String home = '/home';

  // Rute latihan navigasi 4 metode
  static const String latihanNavigasi = '/latihan_navigasi';

  // Rute latihan menu drawer samping
  static const String latihanDrawer = '/latihan_drawer';

  // Rute halaman tujuan hasil navigasi
  static const String tujuanNavigasi = '/tujuan_navigasi';

  // Rute tugas mandiri 7 (Syarat & Ketentuan)
  static const String tugas7 = '/tugas7';

  // Rute tugas mandiri 8 (Bottom Navigation Bar)
  static const String tugas8 = '/tugas8';

  // Rute tugas mandiri 9 (Daftar Kategori Produk)
  static const String tugas9 = '/tugas9';

  // Rute tugas mandiri 10 (Formulir Pendaftaran)
  static const String tugas10 = '/tugas10';

  // Rute tugas mandiri 11 (Shared Preferences Session)
  static const String tugas11 = '/tugas11';

  // Rute studio Custom Widget
  static const String customWidget = '/custom_widget';

  // Rute studio Custom UI Screen
  static const String customUi = '/custom_ui';

  // Rute latihan Login Screen dengan SQLite Database
  static const String latihanTextFormFieldLogin = '/latihan_textformfield_login';

  // Rute latihan sesi login dengan Splash Screen auto-redirect
  static const String latihanSharedPrefSession = '/latihan_shared_pref_session';
}
```

---

## 2. Crop Kode Asli: `lib/routing.dart`

File [`lib/routing.dart`](file:///d:/pelatihan/project/pelatihan_app_dev/lib/routing.dart) bertindak sebagai **Peta Navigasi** yang menghubungkan setiap string `AppRoutes` dengan Widget aslinya:

```dart
import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/routes.dart';
import 'package:pelatihan_app_dev/main.dart';
import 'package:pelatihan_app_dev/latihan_widget/drawer/latihan_drawer.dart';
import 'package:pelatihan_app_dev/latihan_widget/navigasi/latihan_navigasi.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_syarat_dan_ketentuan.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/tugas_8.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/tugas_10_register_form.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_shared_preferences.dart';
import 'package:pelatihan_app_dev/custom_widget/halaman_custom_widget.dart';
import 'package:pelatihan_app_dev/custom_ui/halaman_custom_ui_studio.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/halaman_latihan_login_db.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_splash_session.dart';

class AppRouting {
  // Fungsi getRoutes mengembalikan Map<String, WidgetBuilder> yang dibutuhkan oleh MaterialApp.
  static Map<String, WidgetBuilder> getRoutes({
    required bool isDarkMode,
    required ValueChanged<bool> onThemeChanged,
    WidgetBuilder? homeBuilder,
  }) {
    return {
      // 1. Menu Utama: Membangun MultiWidgetApp dengan meneruskan parameter tema
      AppRoutes.home: homeBuilder ??
          ((context) => MultiWidgetApp(
                isDarkMode: isDarkMode,
                onThemeChanged: onThemeChanged,
              )),

      // 2. Latihan Navigasi
      AppRoutes.latihanNavigasi: (context) => const LatihanNavigasi(),

      // 3. Latihan Drawer
      AppRoutes.latihanDrawer: (context) => const LatihanDrawer(),

      // 4. Halaman Tujuan Navigasi
      AppRoutes.tujuanNavigasi: (context) =>
          const HalamanTujuanNavigasi(metode: MetodeNavigasi.pushNamed),

      // 5. Tugas 7: Membutuhkan parameter tema
      AppRoutes.tugas7: (context) => Tugas7(
            isDarkMode: isDarkMode,
            onThemeChanged: onThemeChanged,
          ),

      // 6. Tugas 8: Membutuhkan parameter tema
      AppRoutes.tugas8: (context) => Tugas8(
            isDarkMode: isDarkMode,
            onThemeChanged: onThemeChanged,
          ),

      // 7. Tugas 9: ListView & Model
      AppRoutes.tugas9: (context) => const Tugas9(),

      // 8. Tugas 10: Formulir Pendaftaran
      AppRoutes.tugas10: (context) => const Tugas10(),

      // 9. Tugas 11: Otentikasi Shared Preferences
      AppRoutes.tugas11: (context) => const Tugas11(),

      // 10. Custom Widget Studio
      AppRoutes.customWidget: (context) => const HalamanCustomWidget(),

      // 11. Custom UI Screen Studio
      AppRoutes.customUi: (context) => const HalamanCustomUiStudio(),

      // 12. Login Database SQLite
      AppRoutes.latihanTextFormFieldLogin: (context) => const LoginScreenDB(),

      // 13. Splash Screen Session (Auto Redirect)
      AppRoutes.latihanSharedPrefSession: (context) => const SplashScreenDay15(),
    };
  }

  // Fungsi opsional untuk menangani rute dinamis via onGenerateRoute
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings, {
    required bool isDarkMode,
    required ValueChanged<bool> onThemeChanged,
    WidgetBuilder? homeBuilder,
  }) {
    final routes = getRoutes(
      isDarkMode: isDarkMode,
      onThemeChanged: onThemeChanged,
      homeBuilder: homeBuilder,
    );
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(
        builder: builder,
        settings: settings,
      );
    }
    return null;
  }
}
```

---

## 3. Crop Lengkap Semua Bagian `lib/main.dart` & Penjelasannya

Berikut adalah seluruh komponen yang ada di [`lib/main.dart`](file:///d:/pelatihan/project/pelatihan_app_dev/lib/main.dart) yang dipecah dan dijelaskan secara terperinci:

### 3.1. Bagian Impor (Baris 1 - 37)

```dart
import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/...'; // 15 modul latihan
import 'package:pelatihan_app_dev/tugas/...';          // 11 modul tugas
import 'package:pelatihan_app_dev/app_route_enum.dart';
import 'package:pelatihan_app_dev/routing.dart';       // MODUL ROUTING BARU
import 'package:pelatihan_app_dev/penjelasan/...';
import 'package:pelatihan_app_dev/custom_widget/...';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/core/preference_handler.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/core/preference_handler.dart' as habibi_pref;
```

- **Penjelasan:**
  - Mengimpor pustaka dasar Flutter Material 3.
  - Mengimpor semua file halaman latihan dan tugas yang digunakan pada daftar menu.
  - `import 'package:pelatihan_app_dev/routing.dart';`: Ini adalah modul routing hasil pemisahan. Seluruh peta rute didelegasikan ke file ini sehingga `main.dart` tetap bersih.
  - Mengimpor dua helper `PreferenceHandler` untuk inisialisasi penyimpanan lokal sesi login.

---

### 3.2. Entry Point Aplikasi (Baris 38 - 44)

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHandler.init();
  await habibi_pref.PreferenceHandler.init();
  runApp(const MyApp());
}
```

- **Penjelasan:**
  - `WidgetsFlutterBinding.ensureInitialized()`: Memastikan sistem bridge engine Flutter telah siap sebelum menjalankan operasi async.
  - `await PreferenceHandler.init()` & `await habibi_pref.PreferenceHandler.init()`: Memuat SharedPreferences ke memori sebelum widget pertama digambar.
  - `runApp(const MyApp())`: Menjalankan aplikasi dengan root widget `MyApp`.

---

### 3.3. Root Widget & Integrasi Rute (Baris 45 - 86)

```dart
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
      // DI SINI INTEGRASI RUTE:
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
```

- **Penjelasan:**
  - `_isDarkMode`: Mengatur status tema aktif aplikasi.
  - `home`: Menampilkan layar utama `MultiWidgetApp` saat pertama kali aplikasi dibuka.
  - `routes: AppRouting.getRoutes(...)`: Memasang peta rute dari file `routing.dart`. Cukup satu baris ini saja, tidak perlu lagi mendefinisikan puluhan baris map rute di dalam `main.dart`.

---

### 3.4. Model Data Menu (Baris 88 - 104)

```dart
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
```

- **Penjelasan:**
  - Membungkus data setiap kartu menu di aplikasi (judul materi, deskripsi singkat, ikon, warna aksen, widget halaman, dan rute navigasi `AppRoute?`).

---

### 3.5. Halaman Utama MultiWidgetApp (Baris 106 - 365)

```dart
class MultiWidgetApp extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  ...
}

class _MultiWidgetAppState extends State<MultiWidgetApp> {
  AppSection _currentSection = AppSection.latihan;

  void _navigateTo(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  void _navPushRoute(AppRoute route) {
    Navigator.pushNamed(context, route.path);
  }

  static const List<AppMenuItem> _latihanItems = [ ... ]; // 15 Latihan
  List<AppMenuItem> get _tugasItems => <AppMenuItem>[ ... ]; // 11 Tugas
```

- **Penjelasan:**
  - `_navigateTo(Widget page)`: Navigasi anonim langsung menggunakan `MaterialPageRoute`.
  - `_navPushRoute(AppRoute route)`: Navigasi bernama terdaftar menggunakan `Navigator.pushNamed(context, route.path)`.
  - `_latihanItems` & `_tugasItems`: Daftar kartu materi pelatihan dan tugas.

---

### 3.6. Struktur Tampilan Layar: Scaffold, AppBar, Drawer & BottomBar (Baris 366 - 595)

- **AppBar**: Menampilkan judul section aktif dan tombol cepat membuka Buku Penjelasan Materi (`HalamanKatalogPenjelasan`).
- **Drawer (Menu Samping)**:
  - Header bernuansa gradien dengan avatar dan nama aplikasi.
  - Shortcut ke Katalog Penjelasan, Custom Widget Studio, dan Custom UI Screen Studio (via `Navigator.pushNamed(context, AppRoute.customUi.path)`).
  - Daftar lengkap shortcut ke seluruh latihan dan tugas.
- **Body**: Menampilkan daftar item kartu menggunakan `ListView.builder`.
- **BottomNavigationBar**: Menggunakan `NavigationBar` Material 3 untuk beralih antara 3 section:
  1. Latihan Widget
  2. Tugas Mandiri
  3. Custom Studio

---

### 3.7. Desain Kartu Menu (Baris 596 - 650)

```dart
Widget _buildMenuItemCard(AppMenuItem item) {
  return Card(
    ...
    child: InkWell(
      onTap: () {
        if (item.route != null) {
          _navPushRoute(item.route!); // Panggil pushNamed
        } else {
          _navigateTo(item.page);     // Panggil push biasa
        }
      },
      child: Row(
        children: [
          // Container Ikon Berwarna
          // Kolom Judul & Subjudul
          // Tombol Buku Penjelasan (HalamanPenjelasan)
          // Ikon Panah Kanan
        ],
      ),
    ),
  );
}
```

- **Penjelasan:**
  - Membangun tampilan kartu modern dengan deteksi sentuhan `InkWell`.
  - Jika item memiliki rute terdaftar (`item.route != null`), aplikasi akan memanggil `_navPushRoute` (`Navigator.pushNamed`). Jika belum, aplikasi membuka halaman secara langsung melalui `_navigateTo`.

---

## 4. File Referensi Kode & Komentar Baris per Baris

Untuk melihat implementasi kode yang sudah dilengkapi komentar edukatif pada setiap barisnya, Anda dapat langsung membuka file:

- [`lib/panduan_routes_dan_routing.dart`](file:///d:/pelatihan/project/pelatihan_app_dev/lib/panduan_routes_dan_routing.dart)
