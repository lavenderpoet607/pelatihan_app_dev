import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/components/tugas_7_drawer.dart';

class Tugas7TanggalLahir extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  const Tugas7TanggalLahir({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  State<Tugas7TanggalLahir> createState() => _Tugas7TanggalLahirState();
}

class _Tugas7TanggalLahirState extends State<Tugas7TanggalLahir> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 72, 160),
        foregroundColor: Colors.white,
        title: const Text(
          "Tanggal Lahir",
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
              "Pilih Tanggal Lahir",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _selectDate(context),
              icon: const Icon(Icons.calendar_today),
              label: const Text("Buka Kalender"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 248, 72, 160),
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Tanggal Lahir: ${selectedDate.toLocal().toString().split(' ')[0]}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
