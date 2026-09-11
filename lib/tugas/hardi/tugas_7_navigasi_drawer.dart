import 'package:flutter/material.dart';

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

bool _isChecked = false;
const List<String> list = <String>[
  'Elektronik',
  'Pakaian',
  'Makanan',
  'Lainnya',
];
String dropdownValue = list.first;
DateTime selectedDate = DateTime.now();

class _Tugas7State extends State<Tugas7> {
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Navigasi Drawer",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Milky Cream",
              ),
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              "Syarat & Ketentuan",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  CheckboxListTile(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    title: Text(
                      "Saya menyetujui semua persyaratan yang berlaku",
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Text(
                    _isChecked
                        ? "Lanjutkan pendaftaran diperbolehkan"
                        : "Anda belum bisa melanjutkan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Divider(color: Colors.grey, thickness: 5),
            ),
            Text(
              "Mode Gelap",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (bool value) {
                      widget.onThemeChanged(value);
                    },
                    title: const Text("Aktifkan Mode Gelap"),
                  ),
                  Text(
                    Theme.of(context).brightness == Brightness.dark
                        ? "Mode Gelap Aktif"
                        : "Mode Terang Aktif",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Divider(color: Colors.grey, thickness: 5),
            ),
            Text(
              "Kategori",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Text(
                    "Anda memilih kategori: $dropdownValue",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Divider(color: Colors.grey, thickness: 5),
            ),
            Text(
              "Pilih Tanggal Lahir",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                "Pilih Tanggal Lahir: ${selectedDate.toLocal().toString().split(' ')[0]}",
              ),
            ),
            Text(
              "Tanggal Lahir: ${selectedDate.toLocal().toString().split(' ')[0]}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: double.infinity,
              child: Divider(color: Colors.grey, thickness: 5),
            ),
            Text(
              "Atur Pengingat",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text("Pilih Waktu Pengingat"),
            ),
            Text(
              selectedTime == null
                  ? "Belum ada waktu pengingat"
                  : "Pengingat diatur pukul: ${selectedTime!.format(context)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
