import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/extensions/extended_navigator.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_home_session.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_login_session.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_splash_session.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/core/preference_handler.dart';

class LatihanSharedPreferencesSession extends StatefulWidget {
  const LatihanSharedPreferencesSession({super.key});

  @override
  State<LatihanSharedPreferencesSession> createState() =>
      _LatihanSharedPreferencesSessionState();
}

class _LatihanSharedPreferencesSessionState
    extends State<LatihanSharedPreferencesSession> {
  bool _isLogin = false;
  String _username = '';
  String _loginTime = '';

  @override
  void initState() {
    super.initState();
    _refreshState();
  }

  void _refreshState() {
    setState(() {
      _isLogin = PreferenceHandler.isLogin;
      _username = PreferenceHandler.username;
      _loginTime = PreferenceHandler.loginTime;
    });
  }

  Future<void> _resetSession() async {
    await PreferenceHandler.logOut();
    _refreshState();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sesi berhasil direset. isLogin sekarang false.'),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan SharedPreferences (Day 15)'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Refresh Status',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _refreshState,
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
                      Colors.indigo.shade600,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.storage_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Day 15: Session & Navigator',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'SharedPreferences + ExtendedNavigator',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Status Sesi Aktif:',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          Text(
                            _isLogin ? 'SUDAH LOGIN' : 'BELUM LOGIN',
                            style: TextStyle(
                              color: _isLogin
                                  ? Colors.greenAccent
                                  : Colors.amberAccent,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_isLogin) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Pengguna: $_username ($_loginTime)',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Uji Coba Alur Halaman',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Icon(Icons.flash_on_rounded, color: Colors.white),
                  ),
                  title: const Text(
                    'Mulai dari SplashScreenDay15',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Mengecek sesi isLogin lalu auto-redirect',
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () async {
                    await context.push(const SplashScreenDay15());
                    _refreshState();
                  },
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.login_rounded, color: Colors.white),
                  ),
                  title: const Text(
                    'Buka Langsung LoginScreenDay15',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Form autentikasi dan penyimpanan session',
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () async {
                    await context.push(const LoginScreenDay15());
                    _refreshState();
                  },
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.dashboard_rounded, color: Colors.white),
                  ),
                  title: const Text(
                    'Buka Langsung HomeScreenDay15',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Dashboard pengujian seluruh metode ExtendedNavigator',
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () async {
                    await context.push(const HomeScreenDay15());
                    _refreshState();
                  },
                ),
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: _resetSession,
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.redAccent,
                ),
                label: const Text(
                  'Reset Sesi (Logout SharedPreferences)',
                  style: TextStyle(color: Colors.redAccent),
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
}
