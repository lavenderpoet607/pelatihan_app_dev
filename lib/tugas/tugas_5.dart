import 'package:flutter/material.dart';

class Tugas5 extends StatelessWidget {
  const Tugas5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 64, 64),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ListView & ListTile",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Text("--- Bagian Form ---"),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
              labelText: 'Name',
              hintText: 'Enter YourName',
            ),
          ),
          SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.contact_phone),
              border: OutlineInputBorder(),
              labelText: 'Contact',
              hintText: 'Enter Your Contact',
            ),
          ),
          SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone_android),
              border: OutlineInputBorder(),
              labelText: 'Number Phone',
              hintText: 'Enter Your Number',
            ),
          ),
          SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.location_city_outlined),
              border: OutlineInputBorder(),
              labelText: 'Address',
              hintText: 'Enter Address',
            ),
          ),
          SizedBox(height: 30),
          Text("--- Bagian Daftar (List) ---"),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Andi Rahmat'),
              subtitle: const Text('Aktif'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Budi Santoso'),
              subtitle: const Text('Non-Aktif'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Citra Natalia'),
              subtitle: const Text('Aktif'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Dede'),
              subtitle: const Text('Non-Aktif'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Ridho'),
              subtitle: const Text('Aktif'),
            ),
          ),
        ],
      ),
    );
  }
}
