import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/core/tugas_9_data.dart';

class Tugas9TabList extends StatelessWidget {
  const Tugas9TabList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: kategoriList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF0284C7).withAlpha(25),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Color(0xFF0284C7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              kategoriList[index],
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
