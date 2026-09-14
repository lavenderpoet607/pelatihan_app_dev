import 'package:flutter/material.dart';

class LatihanGridview extends StatelessWidget {
  const LatihanGridview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridItems = [
      {
        'title': 'Item 1',
        'color': Colors.blue.shade400,
        'icon': Icons.dashboard,
      },
      {'title': 'Item 2', 'color': Colors.teal.shade400, 'icon': Icons.image},
      {'title': 'Item 3', 'color': Colors.orange.shade400, 'icon': Icons.star},
      {
        'title': 'Item 4',
        'color': Colors.purple.shade400,
        'icon': Icons.favorite,
      },
      {
        'title': 'Item 5',
        'color': Colors.pink.shade400,
        'icon': Icons.camera_alt,
      },
      {
        'title': 'Item 6',
        'color': Colors.indigo.shade400,
        'icon': Icons.settings,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.0,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: item['color'] as Color,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {},
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['title'] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
