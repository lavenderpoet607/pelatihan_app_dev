import 'package:flutter/material.dart';

enum Tugas10FormField {
  namaLengkap(
    label: 'Nama Lengkap',
    hint: 'Masukkan nama lengkap Anda',
    icon: Icons.person_rounded,
    isRequired: true,
  ),
  email(
    label: 'Email',
    hint: 'nama@domain.com',
    icon: Icons.email_rounded,
    isRequired: true,
  ),
  nomorHp(
    label: 'Nomor HP (Opsional)',
    hint: 'Contoh: 08123456789',
    icon: Icons.phone_rounded,
    isRequired: false,
  ),
  kotaAsal(
    label: 'Kota Asal',
    hint: 'Contoh: Jakarta, Surabaya, Bandung',
    icon: Icons.location_city_rounded,
    isRequired: true,
  ),
  peminatan(
    label: 'Peminatan Pelatihan',
    hint: 'Pilih jalur kelas pelatihan',
    icon: Icons.school_rounded,
    isRequired: true,
  );

  final String label;
  final String hint;
  final IconData icon;
  final bool isRequired;

  const Tugas10FormField({
    required this.label,
    required this.hint,
    required this.icon,
    required this.isRequired,
  });
}

enum Tugas10Peminatan {
  flutterMobile(
    label: 'Flutter Mobile App Development',
    icon: Icons.phone_android_rounded,
    color: Colors.blueAccent,
  ),
  webFrontend(
    label: 'Frontend Web Development',
    icon: Icons.web_rounded,
    color: Colors.teal,
  ),
  uiUxDesign(
    label: 'UI/UX Design & Prototyping',
    icon: Icons.palette_rounded,
    color: Colors.purple,
  ),
  backendPython(
    label: 'Backend & Cloud Development',
    icon: Icons.dns_rounded,
    color: Colors.orange,
  );

  final String label;
  final IconData icon;
  final Color color;

  const Tugas10Peminatan({
    required this.label,
    required this.icon,
    required this.color,
  });
}

enum Tugas10DialogAction { batal, lanjut }
