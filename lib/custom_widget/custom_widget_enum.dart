import 'package:flutter/material.dart';

enum CustomWidgetType {
  card(
    label: 'Custom Card',
    icon: Icons.credit_card_rounded,
    kategori: 'Container & Layout',
    deskripsi: 'Komponen kartu dengan dekorasi kustom, sudut melengkung, bayangan, dan event ketukan.',
  ),
  button(
    label: 'Custom Button',
    icon: Icons.smart_button_rounded,
    kategori: 'Interaksi & Aksi',
    deskripsi: 'Tombol aksi primer responsif dengan indikator loading, gradasi warna, dan umpan balik sentuh.',
  ),
  inputField(
    label: 'Custom TextField',
    icon: Icons.text_fields_rounded,
    kategori: 'Form & Input',
    deskripsi: 'Formulir input teks modern dengan dekorasi border dinamis, ikon prefix/suffix, dan status fokus.',
  ),
  avatar(
    label: 'Custom Avatar',
    icon: Icons.account_circle_rounded,
    kategori: 'Profil & Identitas',
    deskripsi: 'Avatar profil melingkar dengan border ganda, badge status online/offline, dan elevasi.',
  ),
  banner(
    label: 'Custom Alert Banner',
    icon: Icons.notifications_active_rounded,
    kategori: 'Notifikasi & Feedback',
    deskripsi: 'Banner peringatan atau pesan informasi dengan latar tematik, ikon status, dan tombol aksi cepat.',
  );

  final String label;
  final IconData icon;
  final String kategori;
  final String deskripsi;

  const CustomWidgetType({
    required this.label,
    required this.icon,
    required this.kategori,
    required this.deskripsi,
  });
}

enum CustomActionType {
  snackBar(
    label: 'Tampilkan SnackBar',
    icon: Icons.message_rounded,
    deskripsi: 'Memunculkan notifikasi singkat di bagian bawah layar menggunakan ScaffoldMessenger.',
  ),
  dialogAlert(
    label: 'Tampilkan Dialog',
    icon: Icons.open_in_browser_rounded,
    deskripsi: 'Membuka modal pop-up AlertDialog untuk konfirmasi atau informasi mendalam.',
  ),
  modalBottomSheet(
    label: 'Modal Bottom Sheet',
    icon: Icons.call_to_action_rounded,
    deskripsi: 'Menggeser panel lembar menu aksi dari bawah layar ke atas.',
  ),
  toggleState(
    label: 'Ubah State Internal',
    icon: Icons.published_with_changes_rounded,
    deskripsi: 'Mengubah nilai boolean atau counter secara langsung pada widget tree.',
  );

  final String label;
  final IconData icon;
  final String deskripsi;

  const CustomActionType({
    required this.label,
    required this.icon,
    required this.deskripsi,
  });
}

enum CustomColorTheme {
  blue(
    name: 'Ocean Blue',
    primaryColor: Color(0xFF2563EB),
    accentColor: Color(0xFF60A5FA),
    lightBackground: Color(0xFFEFF6FF),
  ),
  indigo(
    name: 'Deep Indigo',
    primaryColor: Color(0xFF4F46E5),
    accentColor: Color(0xFF818CF8),
    lightBackground: Color(0xFFEEF2FF),
  ),
  teal(
    name: 'Cyan Teal',
    primaryColor: Color(0xFF0D9488),
    accentColor: Color(0xFF2DD4BF),
    lightBackground: Color(0xFFF0FDFA),
  ),
  emerald(
    name: 'Fresh Emerald',
    primaryColor: Color(0xFF059669),
    accentColor: Color(0xFF34D399),
    lightBackground: Color(0xFFECFDF5),
  ),
  amber(
    name: 'Sun Amber',
    primaryColor: Color(0xFFD97706),
    accentColor: Color(0xFFFBBF24),
    lightBackground: Color(0xFFFFFBEB),
  ),
  rose(
    name: 'Ruby Rose',
    primaryColor: Color(0xFFE11D48),
    accentColor: Color(0xFFFB7185),
    lightBackground: Color(0xFFFFF1F2),
  ),
  purple(
    name: 'Mystic Purple',
    primaryColor: Color(0xFF7C3AED),
    accentColor: Color(0xFFA78BFA),
    lightBackground: Color(0xFFF5F3FF),
  );

  final String name;
  final Color primaryColor;
  final Color accentColor;
  final Color lightBackground;

  const CustomColorTheme({
    required this.name,
    required this.primaryColor,
    required this.accentColor,
    required this.lightBackground,
  });
}

