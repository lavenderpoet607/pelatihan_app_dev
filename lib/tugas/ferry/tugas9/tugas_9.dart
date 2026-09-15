import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_tab_enum.dart';

export 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_card_produk.dart';
export 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_data.dart';
export 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_model_produk.dart';
export 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_tab_enum.dart';
export 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_tab_list.dart';
export 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_tab_map.dart';
export 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9_tab_model.dart';

class Tugas9 extends StatelessWidget {
  const Tugas9({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Tugas9Tab.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Kategori Toko',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Milky Cream',
              fontSize: 22,
            ),
          ),
          backgroundColor: const Color(0xFF0284C7),
          foregroundColor: Colors.white,
          elevation: 1,
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: Tugas9Tab.values
                .map((tab) => Tab(icon: Icon(tab.icon), text: tab.label))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: Tugas9Tab.values.map((tab) => tab.widget).toList(),
        ),
      ),
    );
  }
}
