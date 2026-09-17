import 'package:flutter/material.dart';

class AutoLoginCard extends StatelessWidget {
  final VoidCallback onTest;

  const AutoLoginCard({super.key, required this.onTest});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.blue.shade50.withAlpha(100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blue.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome_rounded, color: Colors.blue.shade700),
                const SizedBox(width: 10),
                const Text(
                  'Uji Fitur Auto-Login (Keep Login)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Tekan tombol di bawah untuk membuka Splash Screen kembali. Karena status sesi tersimpan adalah TRUE, Splash Screen akan otomatis mengarahkan kembali ke Home tanpa meminta login ulang.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.blueGrey.shade700,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue.shade700,
                  side: BorderSide(color: Colors.blue.shade400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: onTest,
                icon: const Icon(Icons.replay_rounded, size: 18),
                label: const Text('Buka Ulang Splash Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
