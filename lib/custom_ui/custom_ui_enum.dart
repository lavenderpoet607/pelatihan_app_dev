import 'package:flutter/material.dart';

enum CustomUiTemplate {
  profileScreen(
    label: 'Profil Pengguna',
    icon: Icons.account_box_rounded,
    kategori: 'User & Social',
    deskripsi: 'Halaman profil sosial lengkap dengan foto sampul, avatar melingkar, statistik pengikut, bio, dan tombol aksi.',
  ),
  ecommerceDetail(
    label: 'Detail Produk Toko',
    icon: Icons.shopping_bag_rounded,
    kategori: 'E-Commerce',
    deskripsi: 'Halaman katalog produk toko modern dengan galeri foto, badge diskon, pemilih varian, dan tombol beli di floating bar.',
  ),
  newsFeed(
    label: 'Feed Berita & Artikel',
    icon: Icons.article_rounded,
    kategori: 'Content & Media',
    deskripsi: 'Halaman portal berita dengan headline utama bergradasi, filter tag topik, kartu artikel berita, dan fitur bookmark.',
  ),
  dashboardAnalytics(
    label: 'Dashboard Ringkasan',
    icon: Icons.analytics_rounded,
    kategori: 'Finance & Metrik',
    deskripsi: 'Halaman metrik analitik dengan kartu saldo/KPI, grafik mini representatif, dan daftar riwayat transaksi terbaru.',
  ),
  formCheckout(
    label: 'Formulir Pembayaran',
    icon: Icons.receipt_long_rounded,
    kategori: 'Transaction & Form',
    deskripsi: 'Formulir checkout transaksi dengan detail pengiriman, pilihan metode pembayaran, rincian biaya, dan tombol konfirmasi bayar.',
  );

  final String label;
  final IconData icon;
  final String kategori;
  final String deskripsi;

  const CustomUiTemplate({
    required this.label,
    required this.icon,
    required this.kategori,
    required this.deskripsi,
  });
}

enum DeviceFrameType {
  smartphone(
    label: 'Smartphone',
    icon: Icons.phone_android_rounded,
    width: 340.0,
    height: 640.0,
    cornerRadius: 32.0,
  ),
  tablet(
    label: 'Tablet',
    icon: Icons.tablet_android_rounded,
    width: 440.0,
    height: 580.0,
    cornerRadius: 24.0,
  ),
  responsive(
    label: 'Responsive Full',
    icon: Icons.fit_screen_rounded,
    width: double.infinity,
    height: 560.0,
    cornerRadius: 16.0,
  );

  final String label;
  final IconData icon;
  final double width;
  final double height;
  final double cornerRadius;

  const DeviceFrameType({
    required this.label,
    required this.icon,
    required this.width,
    required this.height,
    required this.cornerRadius,
  });
}

enum UiThemePreset {
  modernBlue(
    name: 'Modern Blue',
    primary: Color(0xFF2563EB),
    accent: Color(0xFF38BDF8),
    cardBgLight: Colors.white,
    cardBgDark: Color(0xFF1E293B),
    bgLight: Color(0xFFF1F5F9),
    bgDark: Color(0xFF0F172A),
    textLight: Color(0xFF0F172A),
    textDark: Colors.white,
  ),
  darkCyber(
    name: 'Dark Cyberpunk',
    primary: Color(0xFF06B6D4),
    accent: Color(0xFFF43F5E),
    cardBgLight: Colors.white,
    cardBgDark: Color(0xFF18181B),
    bgLight: Color(0xFFF4F4F5),
    bgDark: Color(0xFF09090B),
    textLight: Color(0xFF18181B),
    textDark: Color(0xFFFAFAFA),
  ),
  pastelSunset(
    name: 'Pastel Sunset',
    primary: Color(0xFFE11D48),
    accent: Color(0xFFFB923C),
    cardBgLight: Colors.white,
    cardBgDark: Color(0xFF27272A),
    bgLight: Color(0xFFFFF7ED),
    bgDark: Color(0xFF18181B),
    textLight: Color(0xFF431407),
    textDark: Color(0xFFFED7AA),
  ),
  emeraldEco(
    name: 'Emerald Eco',
    primary: Color(0xFF059669),
    accent: Color(0xFF10B981),
    cardBgLight: Colors.white,
    cardBgDark: Color(0xFF132A1F),
    bgLight: Color(0xFFECFDF5),
    bgDark: Color(0xFF06180E),
    textLight: Color(0xFF064E3B),
    textDark: Color(0xFFD1FAE5),
  ),
  luxuryGold(
    name: 'Luxury Gold',
    primary: Color(0xFFD97706),
    accent: Color(0xFFF59E0B),
    cardBgLight: Colors.white,
    cardBgDark: Color(0xFF261D11),
    bgLight: Color(0xFFFFFBEB),
    bgDark: Color(0xFF160E04),
    textLight: Color(0xFF451A03),
    textDark: Color(0xFFFEF3C7),
  );

  final String name;
  final Color primary;
  final Color accent;
  final Color cardBgLight;
  final Color cardBgDark;
  final Color bgLight;
  final Color bgDark;
  final Color textLight;
  final Color textDark;

  const UiThemePreset({
    required this.name,
    required this.primary,
    required this.accent,
    required this.cardBgLight,
    required this.cardBgDark,
    required this.bgLight,
    required this.bgDark,
    required this.textLight,
    required this.textDark,
  });
}
