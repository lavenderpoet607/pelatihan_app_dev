import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_drawer.dart';

class Tugas7Kategori extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  const Tugas7Kategori({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  State<Tugas7Kategori> createState() => _Tugas7KategoriState();
}

class _Tugas7KategoriState extends State<Tugas7Kategori> {
  static const List<String> list = <String>[
    'Elektronik',
    'Pakaian',
    'Makanan',
    'Lainnya',
  ];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 72, 160),
        foregroundColor: Colors.white,
        title: const Text(
          "Pilih Kategori",
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
              "Kategori Produk",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
              underline: Container(height: 2, color: Colors.deepPurpleAccent),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value ?? list.first;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              "Anda memilih kategori: $dropdownValue",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
