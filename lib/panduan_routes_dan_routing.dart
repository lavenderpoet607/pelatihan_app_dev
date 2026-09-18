import 'package:flutter/material.dart';

import 'package:pelatihan_app_dev/routes.dart';
import 'package:pelatihan_app_dev/routing.dart';

// ============================================================================
// PANDUAN LENGKAP ARSITEKTUR ROUTING & KROP KODE ASLI PROYEK
// ============================================================================
// Berkas ini menggunakan kelas rute asli proyek: `AppRoutes` dan `AppRouting`.
// Memuat potongan (crop) kode asli dari `lib/routes.dart`, `lib/routing.dart`,
// dan `lib/main.dart` lengkap dengan penjelasan baris demi baris.
// ============================================================================

// ============================================================================
// BAGIAN 1: KROP KODE ASLI `lib/routes.dart`
// ============================================================================
// File: lib/routes.dart
//
// class AppRoutes {
//   // Rute default awal aplikasi
//   static const String initial = '/';
//
//   // Rute menu utama yang menampilkan katalog latihan & tugas (MultiWidgetApp)
//   static const String home = '/home';
//
//   // Rute latihan navigasi (memperagakan push, pushNamed, pushReplacement, pushAndRemoveUntil)
//   static const String latihanNavigasi = '/latihan_navigasi';
//
//   // Rute latihan drawer (menu navigasi samping dengan UserAccountsDrawerHeader)
//   static const String latihanDrawer = '/latihan_drawer';
//
//   // Rute halaman tujuan yang menerima parameter metode navigasi
//   static const String tujuanNavigasi = '/tujuan_navigasi';
//
//   // Rute tugas mandiri 7 (Form Syarat & Ketentuan dengan validasi & Dark Mode toggle)
//   static const String tugas7 = '/tugas7';
//
//   // Rute tugas mandiri 8 (Bottom Navigation Bar interaktif dengan Drawer dinamis)
//   static const String tugas8 = '/tugas8';
//
//   // Rute tugas mandiri 9 (Daftar Kategori produk menggunakan ListView.builder & Model)
//   static const String tugas9 = '/tugas9';
//
//   // Rute tugas mandiri 10 (Formulir pendaftaran, validasi email/no hp, dialog ringkasan)
//   static const String tugas10 = '/tugas10';
//
//   // Rute tugas mandiri 11 (Otentikasi sesi login lokal menggunakan SharedPreferences)
//   static const String tugas11 = '/tugas11';
//
//   // Rute tugas mandiri 12 (Implementasi Database Lokal dengan SQFLite)
//   static const String tugas12 = '/tugas12';
//
//   // Rute studio interaktif untuk kustomisasi dan uji coba widget Flutter
//   static const String customWidget = '/custom_widget';
//
//   // Rute studio simulator layar penuh dan generator kode UI
//   static const String customUi = '/custom_ui';
//
//   // Rute latihan form login dengan validasi dan otentikasi database lokal SQLite
//   static const String latihanTextFormFieldLogin = '/latihan_textformfield_login';
//
//   // Rute latihan sesi login dengan Splash Screen auto-redirect (SharedPreferences)
//   static const String latihanSharedPrefSession = '/latihan_shared_pref_session';
// }
// ============================================================================

// ============================================================================
// BAGIAN 2: KROP KODE ASLI `lib/routing.dart`
// ============================================================================
// File: lib/routing.dart
//
// class AppRouting {
//   // Fungsi getRoutes mengembalikan Map<String, WidgetBuilder>.
//   // Parameter:
//   // - isDarkMode: Meneruskan status tema gelap/terang ke widget yang membutuhkannya.
//   // - onThemeChanged: Callback untuk mengubah tema aplikasi dari halaman anak.
//   // - homeBuilder: Opsional, kustomisasi pembangun halaman home jika diperlukan.
//   static Map<String, WidgetBuilder> getRoutes({
//     required bool isDarkMode,
//     required ValueChanged<bool> onThemeChanged,
//     WidgetBuilder? homeBuilder,
//   }) {
//     return {
//       AppRoutes.home: homeBuilder ?? ((context) => MultiWidgetApp(isDarkMode: isDarkMode, onThemeChanged: onThemeChanged)),
//       AppRoutes.latihanNavigasi: (context) => const LatihanNavigasi(),
//       AppRoutes.latihanDrawer: (context) => const LatihanDrawer(),
//       AppRoutes.tujuanNavigasi: (context) => const HalamanTujuanNavigasi(metode: MetodeNavigasi.pushNamed),
//       AppRoutes.tugas7: (context) => Tugas7(isDarkMode: isDarkMode, onThemeChanged: onThemeChanged),
//       AppRoutes.tugas8: (context) => Tugas8(isDarkMode: isDarkMode, onThemeChanged: onThemeChanged),
//       AppRoutes.tugas9: (context) => const Tugas9(),
//       AppRoutes.tugas10: (context) => const Tugas10(),
//       AppRoutes.tugas11: (context) => const Tugas11(),
//       AppRoutes.tugas12: (context) => const Tugas12(),
//       AppRoutes.customWidget: (context) => const HalamanCustomWidget(),
//       AppRoutes.customUi: (context) => const HalamanCustomUiStudio(),
//       AppRoutes.latihanTextFormFieldLogin: (context) => const LoginScreenDB(),
//       AppRoutes.latihanSharedPrefSession: (context) => const SplashScreenDay15(),
//     };
//   }
//
//   // Fungsi penanganan rute dinamis (onGenerateRoute)
//   static Route<dynamic>? onGenerateRoute(
//     RouteSettings settings, {
//     required bool isDarkMode,
//     required ValueChanged<bool> onThemeChanged,
//     WidgetBuilder? homeBuilder,
//   }) {
//     final routes = getRoutes(
//       isDarkMode: isDarkMode,
//       onThemeChanged: onThemeChanged,
//       homeBuilder: homeBuilder,
//     );
//     final builder = routes[settings.name];
//     if (builder != null) {
//       return MaterialPageRoute(builder: builder, settings: settings);
//     }
//     return null;
//   }
// }
// ============================================================================

// ============================================================================
// BAGIAN 3: KROP LENGKAP KODE ASLI `lib/main.dart` & PENJELASAN SETIAP KOMPONEN
// ============================================================================
// 3.1. BAGIAN IMPOR PADA main.dart
// - import 'package:flutter/material.dart';
//   Mengimpor pustaka inti widget Material Design bawaan Flutter.
// - import 'package:pelatihan_app_dev/latihan_widget/...';
//   Mengimpor 15 file materi latihan widget (Scaffold, Column, Row, RichText, Icon,
//   CircleAvatar, SingleChildScrollView, ListView, TextField, StatefulWidget,
//   BottomNavigator, Drawer, Navigasi, TextFormField/Login, SharedPreferences).
// - import 'package:pelatihan_app_dev/tugas/...';
//   Mengimpor 11 file tugas mandiri (Tugas 1 s/d 11).
// - import 'package:pelatihan_app_dev/app_route_enum.dart';
//   Mengimpor enum AppRoute dan AppSection untuk navigasi menu dan section tab.
// - import 'package:pelatihan_app_dev/routing.dart';
//   MENGIMPOR MODUL ROUTING: Ini file baru hasil pemisahan agar main.dart bersih.
// - import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/core/preference_handler.dart';
//   import 'package:pelatihan_app_dev/tugas/habibi/tugas11/core/preference_handler.dart' as habibi_pref;
//   Mengimpor service penyimpanan lokal SharedPreferences untuk sesi login.
//
// 3.2. FUNGSI ENTRY POINT: void main() async
// - WidgetsFlutterBinding.ensureInitialized():
//   Memastikan binding engine Flutter telah siap sebelum pemanggilan channel async.
// - await PreferenceHandler.init() & await habibi_pref.PreferenceHandler.init():
//   Memuat data SharedPreferences ke memori sebelum widget pertama digambar.
// - runApp(const MyApp()):
//   Menjalankan root widget aplikasi.
//
// 3.3. ROOT WIDGET: class MyApp extends StatefulWidget
// - bool _isDarkMode = false:
//   State yang menyimpan preferensi tema pengguna (terang/gelap).
// - home: MultiWidgetApp(isDarkMode: _isDarkMode, onThemeChanged: ...)
//   Halaman utama yang pertama kali ditampilkan saat aplikasi dibuka.
// - routes: AppRouting.getRoutes(isDarkMode: _isDarkMode, onThemeChanged: ...)
//   DI SINI INTEGRASI RUTE TERPASANG: Cukup 1 baris memanggil AppRouting!
//
// 3.4. MODEL DATA MENU: class AppMenuItem
// - Model data pembungkus kartu menu: title, subtitle, icon, color, page, route.
//
// 3.5. HALAMAN UTAMA: class MultiWidgetApp extends StatefulWidget
// - _currentSection: Menyimpan tab aktif (AppSection.latihan, tugas, customStudio).
// - _navigateTo(Widget page): Navigasi anonim langsung dengan MaterialPageRoute.
// - _navPushRoute(AppRoute route): Navigasi bernama dengan Navigator.pushNamed(context, route.path).
// - _latihanItems: 15 item latihan widget.
// - _tugasItems: 11 item tugas mandiri.
// - AppBar: Menampilkan judul section dan tombol ke Buku Penjelasan (HalamanKatalogPenjelasan).
// - Drawer: Menu samping bergradien berisi shortcut Custom Studio, Latihan, & Tugas.
// - Body: ListView.builder yang menampilkan kartu menu via _buildMenuItemCard.
// - BottomNavigationBar: NavigationBar Material 3 untuk berpindah tab section.
//
// 3.6. DESAIN KARTU MENU: Widget _buildMenuItemCard(AppMenuItem item)
// - Menampilkan Container ikon berwarna, teks judul, subjudul, dan tombol buku penjelasan.
// - Event onTap: Jika item memiliki route terdaftar, panggil _navPushRoute (Navigator.pushNamed),
//   jika tidak gunakan _navigateTo(item.page).
// ============================================================================

// ============================================================================
// BAGIAN 4: CARA PENGGUNAAN NAVIGASI DENGAN `AppRoutes` ASLI PROYEK
// ============================================================================
class ContohTombolNavigasiNyata extends StatelessWidget {
  const ContohTombolNavigasiNyata({super.key});

  // Contoh metode verifikasi bahwa AppRouting aktif terpasang
  void verifikasiMapRute() {
    final _ = AppRouting.getRoutes(isDarkMode: false, onThemeChanged: (_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Uji Navigasi Rute Asli Proyek')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ------------------------------------------------------------------
          // CONTOH 1: Buka Formulir Pendaftaran Tugas 10 menggunakan AppRoutes
          // ------------------------------------------------------------------
          ListTile(
            leading: const Icon(Icons.app_registration, color: Colors.blue),
            title: const Text('Buka Tugas 10 (Formulir Pendaftaran)'),
            subtitle: const Text(
              'Navigator.pushNamed(context, AppRoutes.tugas10)',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.tugas10);
            },
          ),
          const Divider(),

          // ------------------------------------------------------------------
          // CONTOH 2: Buka Tugas 11 Sesi SharedPreferences menggunakan AppRoutes
          // ------------------------------------------------------------------
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.indigo),
            title: const Text('Buka Tugas 11 (Shared Preferences)'),
            subtitle: const Text(
              'Navigator.pushNamed(context, AppRoutes.tugas11)',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.tugas11);
            },
          ),
          const Divider(),

          // ------------------------------------------------------------------
          // CONTOH 3: Ganti Halaman Aktif ke Login DB menggunakan AppRoutes
          // ------------------------------------------------------------------
          ListTile(
            leading: const Icon(Icons.login, color: Colors.green),
            title: const Text(
              'Ganti Halaman ke Login DB (pushReplacementNamed)',
            ),
            subtitle: const Text(
              'Navigator.pushReplacementNamed(context, AppRoutes.latihanTextFormFieldLogin)',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.latihanTextFormFieldLogin,
              );
            },
          ),
          const Divider(),

          // ------------------------------------------------------------------
          // CONTOH 4: Reset & Kembali ke Home menggunakan AppRoutes
          // ------------------------------------------------------------------
          ListTile(
            leading: const Icon(Icons.home, color: Colors.deepOrange),
            title: const Text(
              'Kembali ke Home & Hapus Riwayat (pushNamedAndRemoveUntil)',
            ),
            subtitle: const Text(
              'Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false)',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
