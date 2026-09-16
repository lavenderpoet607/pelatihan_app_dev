import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/tugas_10_model_peserta.dart';

class HalamanKonfirmasiPendaftaran extends StatelessWidget {
  final PesertaPendaftaranModel peserta;

  const HalamanKonfirmasiPendaftaran({super.key, required this.peserta});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Pendaftaran'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade600, Colors.teal.shade500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withValues(alpha: 0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Pendaftaran Berhasil!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        peserta.pesanSapaan,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.badge_outlined,
                            color: theme.colorScheme.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Data Terdaftar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      _buildDetailRow(
                        icon: Icons.person_outline,
                        label: 'Nama Lengkap',
                        value: peserta.namaLengkap,
                      ),
                      _buildDetailRow(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: peserta.email,
                      ),
                      _buildDetailRow(
                        icon: Icons.phone_outlined,
                        label: 'Nomor HP',
                        value: peserta.nomorHpDisplay,
                      ),
                      _buildDetailRow(
                        icon: Icons.location_city_outlined,
                        label: 'Kota Asal',
                        value: peserta.kotaAsal,
                      ),
                      _buildDetailRow(
                        icon: peserta.peminatan.icon,
                        label: 'Peminatan',
                        value: peserta.peminatan.label,
                      ),
                      _buildDetailRow(
                        icon: Icons.access_time_rounded,
                        label: 'Waktu Daftar',
                        value: peserta.formattedWaktu,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.edit_note_rounded),
                label: const Text('Isi Formulir Baru'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.home_rounded),
                label: const Text('Kembali ke Menu Utama'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
