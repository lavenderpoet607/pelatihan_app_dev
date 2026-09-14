import 'package:flutter/material.dart';

class LatihanNavigasi extends StatelessWidget {
  const LatihanNavigasi({super.key});

  void _metodePush(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HalamanTujuanNavigasi(metode: 'push'),
      ),
    );
  }

  void _metodePushNamed(BuildContext context) {
    Navigator.pushNamed(context, '/tujuan_navigasi');
  }

  void _metodePushReplacement(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const HalamanTujuanNavigasi(metode: 'pushReplacement'),
      ),
    );
  }

  void _metodePushAndRemoveUntil(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const HalamanTujuanNavigasi(metode: 'pushAndRemoveUntil'),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan 4 Metode Navigasi'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 0,
            color: Colors.deepPurple.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.deepPurple.shade100),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Halaman ini mendemonstrasikan 4 metode navigasi utama pada Flutter: push, pushNamed, pushReplacement, dan pushAndRemoveUntil.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
              title: const Text(
                'Navigator.push',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Menumpuk halaman baru di atas halaman saat ini (bisa kembali menggunakan pop)',
              ),
              trailing: ElevatedButton(
                onPressed: () => _metodePush(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Uji push'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: const CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Icon(Icons.link, color: Colors.white),
              ),
              title: const Text(
                'Navigator.pushNamed',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Membuka rute yang telah didaftarkan pada routes MaterialApp (/tujuan_navigasi)',
              ),
              trailing: ElevatedButton(
                onPressed: () => _metodePushNamed(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Uji pushNamed'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.swap_horiz, color: Colors.white),
              ),
              title: const Text(
                'Navigator.pushReplacement',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Menggantikan halaman saat ini dengan halaman baru (halaman ini dihapus dari tumpukan)',
              ),
              trailing: ElevatedButton(
                onPressed: () => _metodePushReplacement(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Uji pushReplacement'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: const CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.clear_all, color: Colors.white),
              ),
              title: const Text(
                'Navigator.pushAndRemoveUntil',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Menghapus semua tumpukan halaman sebelumnya dan membuka halaman baru',
              ),
              trailing: ElevatedButton(
                onPressed: () => _metodePushAndRemoveUntil(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Uji pushAndRemoveUntil'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HalamanTujuanNavigasi extends StatelessWidget {
  final String metode;

  const HalamanTujuanNavigasi({super.key, this.metode = 'push'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Tujuan: $metode'),
        backgroundColor: Colors.deepPurple,
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
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.deepPurple,
                  size: 44,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Navigasi Berhasil!',
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Halaman ini dibuka menggunakan metode: $metode',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
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
                      backgroundColor: Colors.deepPurple,
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
                    foregroundColor: Colors.deepPurple,
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
