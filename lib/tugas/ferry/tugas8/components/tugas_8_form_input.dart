import 'package:flutter/material.dart';

class Tugas8HomeTab extends StatefulWidget {
  const Tugas8HomeTab({super.key});

  @override
  State<Tugas8HomeTab> createState() => _Tugas8HomeTabState();
}

class _Tugas8HomeTabState extends State<Tugas8HomeTab> {
  bool _isChecked = false;
  String _kategori = 'Elektronik';
  DateTime? _tanggalLahir;
  TimeOfDay? _waktuPengingat;
  final TextEditingController _namaController = TextEditingController();

  static const List<String> _kategoriList = [
    'Elektronik',
    'Pakaian',
    'Makanan',
    'Otomotif',
    'Lainnya',
  ];

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  Future<void> _pilihTanggal(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _tanggalLahir ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _tanggalLahir = picked;
      });
    }
  }

  Future<void> _pilihWaktu(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _waktuPengingat ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _waktuPengingat = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.lightBlue.shade200),
            ),
            child: Row(
              children: [
                const Icon(Icons.menu_open_rounded, color: Color(0xFF0284C7)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Drawer aktif pada tab Home ini. Ketuk ikon hamburger di kiri atas atau usap dari tepi kiri untuk membukanya.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.lightBlue.shade900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Form Registrasi & Pengaturan (Tugas 7)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Milky Cream",
                      color: Color(0xFF0284C7),
                    ),
                  ),
                  const SizedBox(height: 14),

                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  DropdownButtonFormField<String>(
                    initialValue: _kategori,
                    decoration: InputDecoration(
                      labelText: "Pilih Kategori Produk",
                      prefixIcon: const Icon(Icons.category),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                    items: _kategoriList.map((kat) {
                      return DropdownMenuItem<String>(
                        value: kat,
                        child: Text(kat),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _kategori = val;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 14),

                  InkWell(
                    onTap: () => _pilihTanggal(context),
                    borderRadius: BorderRadius.circular(10),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Tanggal Lahir",
                        prefixIcon: const Icon(Icons.calendar_month),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                      child: Text(
                        _tanggalLahir == null
                            ? "Belum dipilih (Ketuk untuk memilih)"
                            : "${_tanggalLahir!.day.toString().padLeft(2, '0')}/${_tanggalLahir!.month.toString().padLeft(2, '0')}/${_tanggalLahir!.year}",
                        style: TextStyle(
                          color: _tanggalLahir == null
                              ? Colors.grey
                              : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  InkWell(
                    onTap: () => _pilihWaktu(context),
                    borderRadius: BorderRadius.circular(10),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Atur Pengingat",
                        prefixIcon: const Icon(Icons.access_time),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                      child: Text(
                        _waktuPengingat == null
                            ? "Belum diatur (Ketuk untuk mengatur)"
                            : _waktuPengingat!.format(context),
                        style: TextStyle(
                          color: _waktuPengingat == null
                              ? Colors.grey
                              : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                    title: const Text(
                      "Saya menyetujui semua syarat dan ketentuan yang berlaku.",
                      style: TextStyle(fontSize: 13),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),

                  Text(
                    _isChecked
                        ? "✓ Syarat & Ketentuan telah disetujui"
                        : "✗ Anda belum menyetujui persyaratan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: _isChecked ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: () {
                      final nama = _namaController.text.trim();
                      if (!_isChecked) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Harap setujui syarat & ketentuan terlebih dahulu!",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Data berhasil disimpan! Nama: ${nama.isEmpty ? 'Anonim' : nama}, Kategori: $_kategori",
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    icon: const Icon(Icons.save_rounded),
                    label: const Text(
                      "Simpan Form",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0284C7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          OutlinedButton.icon(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu_open_rounded),
            label: const Text("Buka Drawer Navigasi Tugas 7"),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF0284C7),
              side: const BorderSide(color: Color(0xFF0284C7)),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
