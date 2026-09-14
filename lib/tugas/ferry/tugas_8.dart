import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_kategori.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_mode_gelap.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_pengingat.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_syarat_dan_ketentuan.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_tanggal_lahir.dart';

class Tugas8 extends StatefulWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const Tugas8({super.key, this.onThemeChanged, this.isDarkMode = false});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  int _currentIndex = 0;

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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? "Home - Form Input" : "Tentang Aplikasi",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
        elevation: 1,
      ),

      drawer: _currentIndex == 0 ? _buildDrawer(context) : null,
      body: _currentIndex == 0
          ? _buildHomeTab(context)
          : _buildTentangAplikasiTab(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF0284C7),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            activeIcon: Icon(Icons.info_rounded),
            label: 'Tentang Aplikasi',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0284C7), Color(0xFF38BDF8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text(
              "Ferry (Tugas 8)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text("ferry.developer@pelatihan.dev"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "F",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0284C7),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.description, color: Colors.blue),
            title: const Text("Syarat & Ketentuan (Tugas 7)"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7(
                    onThemeChanged: widget.onThemeChanged ?? (_) {},
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.category, color: Colors.deepPurple),
            title: const Text("Pilih Kategori"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7Kategori(
                    onThemeChanged: widget.onThemeChanged ?? (_) {},
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month, color: Colors.teal),
            title: const Text("Pilih Tanggal Lahir"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7TanggalLahir(
                    onThemeChanged: widget.onThemeChanged ?? (_) {},
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_time, color: Colors.orange),
            title: const Text("Atur Pengingat"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7Pengingat(
                    onThemeChanged: widget.onThemeChanged ?? (_) {},
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.indigo),
            title: const Text("Mode Gelap"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Tugas7ModeGelap(
                    onThemeChanged: widget.onThemeChanged ?? (_) {},
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.black87),
            title: const Text("Kembali ke Menu Utama"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab(BuildContext context) {
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

  Widget _buildTentangAplikasiTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber.shade300),
            ),
            child: Row(
              children: [
                Icon(Icons.lock_outline_rounded, color: Colors.amber.shade900),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Drawer dinonaktifkan pada halaman ini. Ikon menu ditiadakan dan gesture swipe tidak membuka drawer.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.amber.shade900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Center(
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0284C7).withAlpha(25),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.navigation_rounded,
                    size: 50,
                    color: Color(0xFF0284C7),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Aplikasi Navigasi Flutter",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Milky Cream",
                    color: Color(0xFF0284C7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  "Tugas 8 - BottomNavigationBar & Conditional Drawer",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Penjelasan Singkat",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Aplikasi ini dibangun menggunakan framework Flutter dengan struktur navigasi BottomNavigationBar yang menampilkan 2 tampilan berbeda:\n"
                    "1. Tab Home: Menampilkan form input interaktif Tugas 7 dengan Drawer yang tetap aktif dan berfungsi.\n"
                    "2. Tab Tentang Aplikasi: Menampilkan informasi detail deskripsi aplikasi, nama pembuat, dan versi dengan Drawer yang dinonaktifkan.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                  const Divider(height: 32),

                  _buildInfoRow(
                    icon: Icons.person_rounded,
                    color: Colors.indigo,
                    label: "Nama Pembuat",
                    value: "Ferry",
                  ),
                  const SizedBox(height: 16),

                  _buildInfoRow(
                    icon: Icons.school_rounded,
                    color: Colors.teal,
                    label: "Peran / Peserta",
                    value: "Peserta Pelatihan Mobile App Development",
                  ),
                  const SizedBox(height: 16),

                  _buildInfoRow(
                    icon: Icons.verified_rounded,
                    color: Colors.orange,
                    label: "Versi Aplikasi",
                    value: "v1.0.0 (Tugas 8)",
                  ),
                  const SizedBox(height: 16),

                  _buildInfoRow(
                    icon: Icons.flutter_dash,
                    color: Colors.blueAccent,
                    label: "Teknologi",
                    value: "Flutter & Dart",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Fitur Utama Navigasi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureItem(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    text: "BottomNavigationBar dengan 2 Tab (Home & Tentang)",
                  ),
                  const SizedBox(height: 8),
                  _buildFeatureItem(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    text: "Drawer aktif hanya pada halaman Home (Form Input)",
                  ),
                  const SizedBox(height: 8),
                  _buildFeatureItem(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    text: "Drawer dinonaktifkan pada halaman Tentang Aplikasi",
                  ),
                  const SizedBox(height: 8),
                  _buildFeatureItem(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    text: "Integrasi Form Input Tugas 7 secara interaktif",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required Color color,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
