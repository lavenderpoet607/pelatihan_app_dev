import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/penjelasan/halaman_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/penjelasan_data.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/login_form_card.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/login_header.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/core/preference_handler.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/extensions/navigator_extension.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_home_screen.dart';

class Tugas11LoginScreen extends StatefulWidget {
  final bool isFromLogout;

  const Tugas11LoginScreen({super.key, this.isFromLogout = false});

  @override
  State<Tugas11LoginScreen> createState() => _Tugas11LoginScreenState();
}

class _Tugas11LoginScreenState extends State<Tugas11LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.isFromLogout) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.showSnackBar(
          'Berhasil Logout',
          backgroundColor: Colors.red.shade600,
          icon: Icons.check_circle_outline,
        );
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _autofillDemo() {
    setState(() {
      _usernameController.text = 'Habibi';
      _passwordController.text = 'flutter2026';
    });
  }

  Future<void> _handleLogin() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 600));

    final username = _usernameController.text.trim();

    await PreferenceHandler.setLogin(true);
    await PreferenceHandler.setUsername(username);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    context.showSnackBar(
      'Login berhasil! Selamat datang, $username.',
      backgroundColor: Colors.green.shade600,
      icon: Icons.check_circle_rounded,
    );

    context.pushReplacement(const Tugas11HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Login Sesi (Tugas 11)',
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
            tooltip: 'Autofill Akun Demo',
            icon: const Icon(Icons.auto_fix_high_rounded, color: Colors.blue),
            onPressed: _autofillDemo,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoginHeader(),
                  const SizedBox(height: 32),
                  LoginFormCard(
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    obscurePassword: _obscurePassword,
                    onToggleObscure: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.login_rounded, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Masuk',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton.icon(
                      onPressed: _autofillDemo,
                      icon: const Icon(
                        Icons.tips_and_updates_outlined,
                        size: 18,
                      ),
                      label: const Text('Gunakan data akun demo'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
