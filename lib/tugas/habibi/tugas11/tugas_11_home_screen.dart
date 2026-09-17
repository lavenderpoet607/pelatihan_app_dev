import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/penjelasan/halaman_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/penjelasan_data.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/auto_login_card.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/session_banner.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/session_info_card.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/core/preference_handler.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/extensions/navigator_extension.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_login_screen.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_splash_screen.dart';

class Tugas11HomeScreen extends StatefulWidget {
  const Tugas11HomeScreen({super.key});

  @override
  State<Tugas11HomeScreen> createState() => _Tugas11HomeScreenState();
}

class _Tugas11HomeScreenState extends State<Tugas11HomeScreen> {
  String _username = '';
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
    _loadSessionData();
  }

  void _loadSessionData() {
    setState(() {
      _username = PreferenceHandler.username;
      _isLogin = PreferenceHandler.isLogin;
    });
  }

  Future<void> _handleLogout() async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.logout_rounded, color: Colors.red),
            SizedBox(width: 8),
            Text('Konfirmasi Logout'),
          ],
        ),
        content: const Text(
          'Apakah Anda yakin ingin keluar dari sesi aplikasi? Status login akan diubah menjadi false.',
        ),
        actions: [
          TextButton(
            onPressed: () => ctx.pop(false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            onPressed: () => ctx.pop(true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    await PreferenceHandler.setLogin(false);
    await PreferenceHandler.logout();

    if (!mounted) return;

    context.pushReplacement(const Tugas11LoginScreen(isFromLogout: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Dashboard Sesi (Tugas 11)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        elevation: 0,
        actions: [
          IconButton(
            tooltip: 'Penjelasan Tugas 11',
            icon: const Icon(Icons.menu_book_rounded, color: Colors.blue),
            onPressed: () {
              final penjelasan = cariPenjelasanItem(
                'Tugas: Shared Preferences',
              );
              if (penjelasan != null) {
                context.push(HalamanPenjelasan(item: penjelasan));
              }
            },
          ),
          IconButton(
            tooltip: 'Logout Sesi',
            icon: const Icon(Icons.logout_rounded, color: Colors.red),
            onPressed: _handleLogout,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.indigo.shade800],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  _username.isNotEmpty ? _username[0].toUpperCase() : 'U',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              accountName: Text(
                _username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              accountEmail: const Text('Status: Sesi Login Aktif'),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded, color: Colors.blue),
              title: const Text('Dashboard'),
              selected: true,
              onTap: () => context.pop(),
            ),
            ListTile(
              leading: const Icon(
                Icons.menu_book_rounded,
                color: Colors.indigo,
              ),
              title: const Text('Buku Penjelasan Tugas 11'),
              subtitle: const Text('Teori & implementasi Shared Preferences'),
              onTap: () {
                context.pop();
                final penjelasan = cariPenjelasanItem(
                  'Tugas: Shared Preferences',
                );
                if (penjelasan != null) {
                  context.push(HalamanPenjelasan(item: penjelasan));
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh_rounded, color: Colors.teal),
              title: const Text('Uji Auto-Login (Buka Splash)'),
              subtitle: const Text('Membuktikan fitur Keep Login'),
              onTap: () {
                context.pop();
                context.push(const Tugas11SplashScreen());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.red),
              title: const Text(
                'Logout / Keluar Sesi',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                context.pop();
                _handleLogout();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SessionBanner(username: _username),
            const SizedBox(height: 24),
            SessionInfoCard(isLogin: _isLogin, username: _username),
            const SizedBox(height: 20),
            AutoLoginCard(
              onTest: () {
                context.push(const Tugas11SplashScreen());
              },
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _handleLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.logout_rounded),
                label: const Text(
                  'Logout dari Sesi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
