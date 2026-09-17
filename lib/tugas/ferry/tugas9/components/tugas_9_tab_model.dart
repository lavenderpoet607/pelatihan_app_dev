import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/components/tugas_9_card_produk.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/core/tugas_9_data.dart';

class Tugas9TabModel extends StatelessWidget {
  const Tugas9TabModel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: produkList.length,
      itemBuilder: (context, index) {
        return ListProduk(produk: produkList[index]);
      },
    );
  }
}
