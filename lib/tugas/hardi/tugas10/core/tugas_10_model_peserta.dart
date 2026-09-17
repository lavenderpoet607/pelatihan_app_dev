import 'package:pelatihan_app_dev/tugas/hardi/tugas10/core/tugas_10_enum.dart';

class PesertaPendaftaranModel {
  final String namaLengkap;
  final String email;
  final String nomorHp;
  final String kotaAsal;
  final Tugas10Peminatan peminatan;
  final DateTime waktuDaftar;

  const PesertaPendaftaranModel({
    required this.namaLengkap,
    required this.email,
    required this.nomorHp,
    required this.kotaAsal,
    required this.peminatan,
    required this.waktuDaftar,
  });

  String get pesanSapaan {
    return 'Terima kasih, $namaLengkap dari $kotaAsal telah mendaftar.';
  }

  String get nomorHpDisplay {
    final trimmed = nomorHp.trim();
    return trimmed.isEmpty ? '-' : trimmed;
  }

  String get formattedWaktu {
    final d = waktuDaftar.day.toString().padLeft(2, '0');
    final m = waktuDaftar.month.toString().padLeft(2, '0');
    final y = waktuDaftar.year.toString();
    final h = waktuDaftar.hour.toString().padLeft(2, '0');
    final min = waktuDaftar.minute.toString().padLeft(2, '0');
    return '$d/$m/$y $h:$min WIB';
  }

  PesertaPendaftaranModel copyWith({
    String? namaLengkap,
    String? email,
    String? nomorHp,
    String? kotaAsal,
    Tugas10Peminatan? peminatan,
    DateTime? waktuDaftar,
  }) {
    return PesertaPendaftaranModel(
      namaLengkap: namaLengkap ?? this.namaLengkap,
      email: email ?? this.email,
      nomorHp: nomorHp ?? this.nomorHp,
      kotaAsal: kotaAsal ?? this.kotaAsal,
      peminatan: peminatan ?? this.peminatan,
      waktuDaftar: waktuDaftar ?? this.waktuDaftar,
    );
  }
}
