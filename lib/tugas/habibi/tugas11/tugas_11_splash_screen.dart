import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/core/preference_handler.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/extensions/navigator_extension.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_home_screen.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_login_screen.dart';

class Tugas11SplashScreen extends StatefulWidget {
  const Tugas11SplashScreen({super.key});

  @override
  State<Tugas11SplashScreen> createState() => _Tugas11SplashScreenState();
}

class _Tugas11SplashScreenState extends State<Tugas11SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSessionAndNavigate();
  }

  Future<void> _checkSessionAndNavigate() async {
    await PreferenceHandler.init();
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final bool isUserLoggedIn = PreferenceHandler.isLogin;

    if (isUserLoggedIn) {
      context.pushReplacement(const Tugas11HomeScreen());
    } else {
      context.pushReplacement(const Tugas11LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.indigo.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(35),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(40),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.lock_clock_rounded,
                  size: 72,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Tugas 11 Flutter',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Implementasi Sesi Pengguna\n(Shared Preferences)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withAlpha(200),
                  height: 1.4,
                ),
              ),
              const Spacer(),
              const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Memeriksa status sesi pengguna...',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withAlpha(180),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
