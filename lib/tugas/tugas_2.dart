import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.view_headline,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Luminous News",
              style: TextStyle(
                color: Color.fromRGBO(112, 196, 252, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Milky Cream",
              ),
            ),
            Spacer(),
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/e5/25/c9/e525c91d9c8fb7ca98f2cc81db0a4d4b.jpg',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Masa Depan Energi Terbarukan: Inovasi EcoSync di Tahun 2024',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                height: 1.3,
                fontStyle: FontStyle.italic,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1508514177221-188b1cf16e9d?w=800&h=400&fit=crop',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Teknologi rumah pintar terus berkembang pesat, membawa efisiensi energi ke tingkat yang belum pernah terbayangkan sebelumnya. Inovasi terbaru dari EcoSync menghadirkan solusi cerdas untuk mengelola konsumsi energi rumah tangga secara otomatis dan real-time.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Apa Itu EcoSync?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'EcoSync adalah platform manajemen energi berbasis AI yang memungkinkan pengguna memantau dan mengoptimalkan penggunaan listrik di rumah. Dengan sensor pintar dan algoritma prediktif, sistem ini dapat menyesuaikan konsumsi energi sesuai dengan kebutuhan dan kebiasaan pengguna.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildBulletPoint('Penghematan energi hingga 40%'),
                  const SizedBox(height: 8),
                  _buildBulletPoint('Integrasi dengan perangkat IoT'),
                  const SizedBox(height: 8),
                  _buildBulletPoint('Dashboard real-time via aplikasi'),
                  const SizedBox(height: 8),
                  _buildBulletPoint('Ramah lingkungan dan berkelanjutan'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(198, 255, 92, 1),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Baca Selengkapnya',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(198, 255, 92, 1),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
