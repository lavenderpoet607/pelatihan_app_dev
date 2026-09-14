import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_drawer.dart';

class Tugas7ModeGelap extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  const Tugas7ModeGelap({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  State<Tugas7ModeGelap> createState() => _Tugas7ModeGelapState();
}

class _Tugas7ModeGelapState extends State<Tugas7ModeGelap> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 72, 160),
        foregroundColor: Colors.white,
        title: const Text(
          "Pengaturan Mode Gelap",
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Mode Tampilan",
                style: TextStyle(
                  fontFamily: "Milky Cream",
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                value: isDark,
                onChanged: (bool value) {
                  widget.onThemeChanged(value);
                },
                title: const Text("Aktifkan Mode Gelap"),
                secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
              ),
              const SizedBox(height: 16),
              Text(
                isDark ? "Mode Gelap Aktif" : "Mode Terang Aktif",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
