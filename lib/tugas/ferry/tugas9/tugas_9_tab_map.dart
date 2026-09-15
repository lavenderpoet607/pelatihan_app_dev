import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_data.dart';

class Tugas9TabMap extends StatelessWidget {
  const Tugas9TabMap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: kategoriMapList.length,
      itemBuilder: (context, index) {
        final item = kategoriMapList[index];
        final Color warna = item['warna'] as Color;
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: warna.withAlpha(35),
              child: Icon(item['icon'] as IconData, color: warna),
            ),
            title: Text(
              item['nama'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Text(
              item['deskripsi'] as String,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
