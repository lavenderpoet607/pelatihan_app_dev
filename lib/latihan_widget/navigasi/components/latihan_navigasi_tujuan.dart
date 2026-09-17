import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/navigasi/latihan_navigasi.dart';

class HalamanTujuanNavigasi extends StatelessWidget {
  final MetodeNavigasi metode;

  const HalamanTujuanNavigasi({super.key, this.metode = MetodeNavigasi.push});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Tujuan: ${metode.nama}'),
        backgroundColor: metode.color,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: metode.color.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Icon(metode.icon, color: metode.color, size: 40),
              ),
              const SizedBox(height: 20),
              Text(
                'Navigasi Berhasil!',
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Halaman ini dibuka menggunakan metode: ${metode.nama}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 6),
              Text(
                metode.penjelasan,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 30),
              if (Navigator.canPop(context))
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali (Navigator.pop)'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: metode.color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LatihanNavigasi(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Buka Ulang Latihan Navigasi'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: metode.color,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Kembali ke Menu Utama'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
