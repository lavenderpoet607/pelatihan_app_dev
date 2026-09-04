import 'package:flutter/material.dart';

class Tugas1 extends StatefulWidget {
  const Tugas1({super.key});

  @override
  State<Tugas1> createState() {
    return _Tugas1State();
  }
}

class _Tugas1State extends State<Tugas1> {
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
      body: Padding(
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
            SizedBox(height: 10),
            Text(
              'Nama: Ridho Dibaja Tawang',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Text(
                  'Alamat: Jl. Kebon Sayur 1 BidacaraCina',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Deskripsi: Bermain Game, Membaca Buku, dan Menulis',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
