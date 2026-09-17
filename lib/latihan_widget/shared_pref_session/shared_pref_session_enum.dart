import 'package:flutter/material.dart';

enum SessionScreenType {
  splash(
    title: 'Splash Screen',
    subtitle: 'Cek status login di SharedPreferences',
    icon: Icons.hourglass_top_rounded,
  ),
  login(
    title: 'Login Screen',
    subtitle: 'Form autentikasi & set session isLogin',
    icon: Icons.login_rounded,
  ),
  home(
    title: 'Home Session',
    subtitle: 'Dashboard sesi aktif & pengujian navigasi',
    icon: Icons.dashboard_rounded,
  ),
  detail(
    title: 'Detail Screen',
    subtitle: 'Halaman anak untuk uji context.pop',
    icon: Icons.info_outline_rounded,
  );

  final String title;
  final String subtitle;
  final IconData icon;

  const SessionScreenType({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

enum SessionNavMethod {
  push(
    label: 'context.push(page)',
    description: 'Menumpuk halaman baru ke atas route stack saat ini',
    icon: Icons.arrow_forward_rounded,
    color: Colors.blue,
  ),
  pushReplacement(
    label: 'context.pushReplacement(page)',
    description: 'Menggantikan halaman saat ini dengan halaman baru',
    icon: Icons.swap_horiz_rounded,
    color: Colors.teal,
  ),
  pushNamed(
    label: 'context.pushNamed(routeName)',
    description:
        'Berpindah rute berdasarkan nama rute yang terdaftar di routes',
    icon: Icons.alt_route_rounded,
    color: Colors.indigo,
  ),
  pushReplacementNamed(
    label: 'context.pushReplacementNamed(routeName)',
    description: 'Mengganti halaman aktif dengan rute bernama',
    icon: Icons.published_with_changes_rounded,
    color: Colors.deepPurple,
  ),
  pushNamedAndRemoveUntil(
    label: 'context.pushNamedAndRemoveUntil(...)',
    description: 'Membuka rute bernama dan membersihkan tumpukan rute lama',
    icon: Icons.delete_sweep_rounded,
    color: Colors.orange,
  ),
  pushAndRemoveAll(
    label: 'context.pushAndRemoveAll(page)',
    description:
        'Membersihkan seluruh tumpukan halaman dan membuka halaman baru',
    icon: Icons.cleaning_services_rounded,
    color: Colors.redAccent,
  ),
  pop(
    label: 'context.pop([result])',
    description: 'Kembali ke halaman sebelumnya dan mengirimkan hasil opsional',
    icon: Icons.arrow_back_rounded,
    color: Colors.grey,
  );

  final String label;
  final String description;
  final IconData icon;
  final Color color;

  const SessionNavMethod({
    required this.label,
    required this.description,
    required this.icon,
    required this.color,
  });
}

enum SessionAuthStatus {
  checking(
    label: 'Memeriksa Sesi...',
    color: Colors.amber,
    icon: Icons.sync_rounded,
  ),
  authenticated(
    label: 'Sudah Login',
    color: Colors.green,
    icon: Icons.verified_user_rounded,
  ),
  unauthenticated(
    label: 'Belum Login',
    color: Colors.redAccent,
    icon: Icons.lock_open_rounded,
  );

  final String label;
  final Color color;
  final IconData icon;

  const SessionAuthStatus({
    required this.label,
    required this.color,
    required this.icon,
  });
}
