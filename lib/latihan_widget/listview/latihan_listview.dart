import 'package:flutter/material.dart';

class LatihanListview extends StatelessWidget {
  const LatihanListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar widget ListView'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Item 1: Ridho'),
              subtitle: const Text('Mobile Developer - Flutter'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Item 2: Dede'),
              subtitle: const Text('UI/UX Designer'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Item 3: Yaqub'),
              subtitle: const Text('Backend Developer'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Item 4: wawa'),
              subtitle: const Text('Product Manager'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Item 5: Imam'),
              subtitle: const Text('Frontend Developer'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Item 6: Faiz'),
              subtitle: const Text('QA Engineer'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
