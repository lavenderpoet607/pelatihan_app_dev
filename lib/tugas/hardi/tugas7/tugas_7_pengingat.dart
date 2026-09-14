import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_drawer.dart';

class Tugas7Pengingat extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  const Tugas7Pengingat({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  State<Tugas7Pengingat> createState() => _Tugas7PengingatState();
}

class _Tugas7PengingatState extends State<Tugas7Pengingat> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
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
          "Atur Pengingat",
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
                "Waktu Pengingat",
                style: TextStyle(
                  fontFamily: "Milky Cream",
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _selectTime(context),
                icon: const Icon(Icons.access_time),
                label: const Text("Pilih Jam & Menit"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 248, 72, 160),
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                selectedTime == null
                    ? "Belum ada waktu pengingat"
                    : "Pengingat diatur pukul: ${selectedTime!.format(context)}",
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
