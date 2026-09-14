import 'package:flutter/material.dart';

class Tugas1Widget extends StatefulWidget {
  const Tugas1Widget({super.key});

  @override
  State<Tugas1Widget> createState() {
    return _Tugas1WidgetState();
  }
}

class _Tugas1WidgetState extends State<Tugas1Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 253, 135),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.view_headline, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/e5/25/c9/e525c91d9c8fb7ca98f2cc81db0a4d4b.jpg',
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nama: Ridho Dibaja Tawang',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Alamat: Jl. Kebon Sayur 1 BidacaraCina',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Deskripsi: Bermain Game, Membaca Buku, dan Menulis',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
