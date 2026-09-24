import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/penjelasan/halaman_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/penjelasan_data.dart';

class LatihanDioPublicApi extends StatefulWidget {
  const LatihanDioPublicApi({super.key});

  @override
  State<LatihanDioPublicApi> createState() => _LatihanDioPublicApiState();
}

class _LatihanDioPublicApiState extends State<LatihanDioPublicApi> {
  final Dio _dio = Dio();
  late Future<List<Map<String, dynamic>>> _apiFuture;

  @override
  void initState() {
    super.initState();
    _apiFuture = _fetchData();
  }

  Future<List<Map<String, dynamic>>> _fetchData() async {
    final response = await _dio.get(
      'https://pokeapi.co/api/v2/pokemon?limit=20',
    );
    if (response.statusCode == 200 && response.data != null) {
      final List rawList = response.data['results'] as List;
      return rawList.map((item) => item as Map<String, dynamic>).toList();
    }
    throw Exception('Gagal mengambil data dari server');
  }

  void _refresh() {
    setState(() {
      _apiFuture = _fetchData();
    });
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Latihan Public API (Dio)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book_rounded),
            tooltip: 'Penjelasan Materi',
            onPressed: () {
              final item = cariPenjelasanItem('Latihan Public API (Dio)');
              if (item != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanPenjelasan(item: item),
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: _refresh,
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _apiFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.blueAccent),
                  SizedBox(height: 12),
                  Text('Memuat data dari API...'),
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Error: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refresh,
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          final items = snapshot.data ?? [];

          return RefreshIndicator(
            onRefresh: () async => _refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final name = _capitalize(item['name'] as String? ?? '');
                final id = index + 1;
                final imageUrl =
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

                return Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      child: Image.network(
                        imageUrl,
                        errorBuilder: (_, _, _) => const Icon(Icons.pets),
                      ),
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('ID Pokemon: $id'),
                    trailing: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.blueAccent,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
