import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/extended_navigator.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_home_session.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_login_session.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/preference_handler.dart';

class SplashScreenDay15 extends StatefulWidget {
  const SplashScreenDay15({super.key});

  @override
  State<SplashScreenDay15> createState() => _SplashScreenDay15State();
}

class _SplashScreenDay15State extends State<SplashScreenDay15> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;

    final sudahLogin = PreferenceHandler.isLogin;

    if (sudahLogin) {
      context.pushReplacement(const HomeScreenDay15());
    } else {
      context.pushReplacement(const LoginScreenDay15());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.indigo.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.flash_on_rounded,
                size: 72,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'PPKD JU 2026',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Day 15: SharedPreferences & ExtendedNavigator',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 48),
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Memeriksa status sesi pengguna...',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
