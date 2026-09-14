import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_drawer.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 72, 160),
        foregroundColor: Colors.white,
        title: const Text(
          "Syarat & Ketentuan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
          ),
        ),
      ),
      drawer: Tugas7Drawer(
        onThemeChanged: widget.onThemeChanged,
        isDarkMode: widget.isDarkMode,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Syarat & Ketentuan",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              title: const Text(
                "Saya menyetujui semua persyaratan yang berlaku",
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 16),
            Text(
              _isChecked
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: _isChecked ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
