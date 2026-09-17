import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/app_route_enum.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/extended_navigator.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_detail_session.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_login_session.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/preference_handler.dart';

class HomeScreenDay15 extends StatefulWidget {
  const HomeScreenDay15({super.key});

  @override
  State<HomeScreenDay15> createState() => _HomeScreenDay15State();
}

class _HomeScreenDay15State extends State<HomeScreenDay15> {
  String _lastNavResult = 'Belum ada uji coba';

  Future<void> _logout() async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Konfirmasi Keluar'),
        content: const Text(
          'Apakah Anda yakin ingin logout dan menghapus session isLogin?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (konfirmasi == true && mounted) {
      await PreferenceHandler.logOut();
      if (!mounted) return;
      context.pushAndRemoveAll(const LoginScreenDay15());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLogin = PreferenceHandler.isLogin;
    final username = PreferenceHandler.username;
    final loginTime = PreferenceHandler.loginTime;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Session (Day 15)'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout_rounded),
            onPressed: _logout,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.shade600,
                      Colors.indigo.shade500,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      child: const Icon(
                        Icons.person_outline_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isLogin
                            ? Colors.green.shade600
                            : Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        isLogin
                            ? 'STATUS: LOGIN AKTIF (isLogin: true)'
                            : 'STATUS: TIDAK LOGIN',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Waktu Login: $loginTime',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.storage_rounded, color: Colors.deepPurple),
                          SizedBox(width: 8),
                          Text(
                            'Status SharedPreferences',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 20),
                      _buildInfoRow('Key "isLogin"', isLogin.toString()),
                      _buildInfoRow('Key "username"', username),
                      _buildInfoRow('Key "loginTime"', loginTime),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Pengujian ExtendedNavigator',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Hasil Navigasi: $_lastNavResult',
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ActionChip(
                    avatar: const Icon(Icons.arrow_forward, size: 16),
                    label: const Text('context.push'),
                    onPressed: () async {
                      final result = await context.push(
                        const DetailScreenDay15(
                          title: 'Uji context.push',
                          content: 'Halaman ini dibuka dengan context.push. Gunakan tombol pop di bawah untuk kembali.',
                        ),
                      );
                      setState(() {
                        _lastNavResult = result != null
                            ? result.toString()
                            : 'Kembali tanpa data';
                      });
                    },
                  ),
                  ActionChip(
                    avatar: const Icon(Icons.swap_horiz, size: 16),
                    label: const Text('context.pushReplacement'),
                    onPressed: () {
                      context.pushReplacement(
                        const DetailScreenDay15(
                          title: 'Uji context.pushReplacement',
                          content: 'Halaman Home sebelumnya telah digantikan di stack.',
                        ),
                      );
                    },
                  ),
                  ActionChip(
                    avatar: const Icon(Icons.alt_route, size: 16),
                    label: const Text('context.pushNamed(home)'),
                    onPressed: () {
                      context.pushNamed(AppRoute.home.path);
                    },
                  ),
                  ActionChip(
                    avatar: const Icon(Icons.cleaning_services, size: 16),
                    label: const Text('context.pushAndRemoveAll'),
                    onPressed: () {
                      context.pushAndRemoveAll(const LoginScreenDay15());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 28),
              OutlinedButton.icon(
                onPressed: _logout,
                icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
                label: const Text(
                  'Logout & Hapus Sesi',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
