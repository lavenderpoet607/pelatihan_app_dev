import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/core/tugas_10_model_peserta.dart';

class Tugas10DialogHelper {
  static Future<void> showRingkasanDialog({
    required BuildContext context,
    required PesertaPendaftaranModel peserta,
    required VoidCallback onLanjut,
  }) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          icon: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.assignment_turned_in_rounded,
              size: 40,
              color: Colors.blueAccent,
            ),
          ),
          title: const Text(
            'Ringkasan Pendaftaran',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Periksa kembali kelengkapan data formulir Anda sebelum melanjutkan:',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                _buildRingkasanItem(
                  icon: Icons.person_rounded,
                  label: 'Nama Lengkap',
                  value: peserta.namaLengkap,
                ),
                _buildRingkasanItem(
                  icon: Icons.email_rounded,
                  label: 'Email',
                  value: peserta.email,
                ),
                _buildRingkasanItem(
                  icon: Icons.phone_rounded,
                  label: 'Nomor HP',
                  value: peserta.nomorHpDisplay,
                ),
                _buildRingkasanItem(
                  icon: Icons.location_city_rounded,
                  label: 'Kota Asal',
                  value: peserta.kotaAsal,
                ),
                _buildRingkasanItem(
                  icon: peserta.peminatan.icon,
                  label: 'Peminatan',
                  value: peserta.peminatan.label,
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Batal'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onLanjut();
              },
              icon: const Icon(Icons.arrow_forward_rounded, size: 16),
              label: const Text('Lanjut'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildRingkasanItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
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
