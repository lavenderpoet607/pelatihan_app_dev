import 'package:flutter/material.dart';

class Produk {
  final String nama;
  final String kategori;
  final String deskripsi;
  final String harga;
  final String gambar;
  final double rating;

  const Produk({
    required this.nama,
    required this.kategori,
    required this.deskripsi,
    required this.harga,
    required this.gambar,
    this.rating = 4.5,
  });
}

class ListProduk extends StatelessWidget {
  final Produk produk;

  const ListProduk({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Memilih ${produk.nama} (${produk.harga})'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  produk.gambar,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.shopping_basket_rounded,
                        size: 40,
                        color: Colors.green,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withAlpha(30),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        produk.kategori,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      produk.nama,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      produk.deskripsi,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          produk.harga,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 18,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              produk.rating.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tugas9 extends StatelessWidget {
  const Tugas9({super.key});

  static const List<String> _kategoriList = [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian Pria',
    'Pakaian Wanita',
    'Alat Tulis Kantor',
    'Buku & Majalah',
    'Peralatan Dapur',
    'Makanan Ringan',
    'Minuman',
  ];

  static const List<Map<String, dynamic>> _kategoriMapList = [
    {
      'nama': 'Buah-buahan',
      'icon': Icons.apple,
      'deskripsi': 'Buah segar lokal dan impor berkualitas tinggi',
      'warna': Colors.red,
    },
    {
      'nama': 'Sayuran',
      'icon': Icons.eco,
      'deskripsi': 'Sayuran hijau organik segar langsung dari kebun',
      'warna': Colors.green,
    },
    {
      'nama': 'Elektronik',
      'icon': Icons.devices,
      'deskripsi': 'Gadget, laptop, smartphone, dan aksesoris teknologi',
      'warna': Colors.blue,
    },
    {
      'nama': 'Pakaian Pria',
      'icon': Icons.male,
      'deskripsi': 'Kemeja, kaos, celana, dan jaket tren terkini',
      'warna': Colors.indigo,
    },
    {
      'nama': 'Pakaian Wanita',
      'icon': Icons.female,
      'deskripsi': 'Blouse, dress, gamis, dan busana fashion trendi',
      'warna': Colors.pink,
    },
    {
      'nama': 'Alat Tulis Kantor',
      'icon': Icons.edit_note,
      'deskripsi': 'Pena, buku catatan, map, dan perlengkapan kantor',
      'warna': Colors.amber,
    },
    {
      'nama': 'Buku & Majalah',
      'icon': Icons.menu_book,
      'deskripsi': 'Buku pelajaran, novel sastra, komik, dan ensiklopedia',
      'warna': Colors.deepOrange,
    },
    {
      'nama': 'Peralatan Dapur',
      'icon': Icons.kitchen,
      'deskripsi': 'Wajan anti lengket, pisau set, blender, dan panci',
      'warna': Colors.teal,
    },
    {
      'nama': 'Makanan Ringan',
      'icon': Icons.cookie,
      'deskripsi': 'Keripik gurih, biskuit, cokelat, dan camilan renyah',
      'warna': Colors.brown,
    },
    {
      'nama': 'Minuman',
      'icon': Icons.local_drink,
      'deskripsi': 'Aneka jus buah segar, kopi bubuk, teh, dan susu kemasan',
      'warna': Colors.cyan,
    },
  ];

  static const List<Produk> _produkList = [
    Produk(
      nama: 'Apel Fuji Super Segar',
      kategori: 'Buah-buahan',
      deskripsi: 'Apel renyah manis kaya kandungan air dan vitamin C alami',
      harga: 'Rp 38.000 / kg',
      gambar: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=300',
      rating: 4.9,
    ),
    Produk(
      nama: 'Pisang Cavendish Sunpride',
      kategori: 'Buah-buahan',
      deskripsi: 'Pisang matang alami, tekstur lembut manis dan tinggi kalium',
      harga: 'Rp 24.500 / sisir',
      gambar:
          'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=300',
      rating: 4.8,
    ),
    Produk(
      nama: 'Jeruk Sunkist Navel Manis',
      kategori: 'Buah-buahan',
      deskripsi: 'Jeruk impor tanpa biji, bulir tebal dan sangat berair segar',
      harga: 'Rp 45.000 / kg',
      gambar:
          'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?w=300',
      rating: 4.7,
    ),
    Produk(
      nama: 'Mangga Harum Manis Matang',
      kategori: 'Buah-buahan',
      deskripsi:
          'Mangga matang pohon asli Probolinggo, aroma harum manis legit',
      harga: 'Rp 32.000 / kg',
      gambar: 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=300',
      rating: 4.9,
    ),
    Produk(
      nama: 'Alpukat Mentega Super',
      kategori: 'Buah-buahan',
      deskripsi:
          'Daging tebal gurih pulen tanpa serat, cocok untuk jus dan salad',
      harga: 'Rp 35.000 / kg',
      gambar:
          'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=300',
      rating: 4.8,
    ),
    Produk(
      nama: 'Anggur Merah Red Globe',
      kategori: 'Buah-buahan',
      deskripsi:
          'Anggur merah segar ukuran besar, rasa manis renyah menggugah selera',
      harga: 'Rp 58.000 / kg',
      gambar:
          'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=300',
      rating: 4.8,
    ),
    Produk(
      nama: 'Semangka Merah Non Biji',
      kategori: 'Buah-buahan',
      deskripsi: 'Semangka segar manis berair banyak, penyejuk dahaga alami',
      harga: 'Rp 28.000 / buah',
      gambar:
          'https://images.unsplash.com/photo-1589984662646-e7b2e4962f18?w=300',
      rating: 4.7,
    ),
    Produk(
      nama: 'Melon Madu Hijau Segar',
      kategori: 'Buah-buahan',
      deskripsi: 'Melon harum manis tekstur garing renyah, kaya serat alami',
      harga: 'Rp 30.000 / buah',
      gambar:
          'https://images.unsplash.com/photo-1571575173700-afb9492e6a50?w=300',
      rating: 4.6,
    ),
    Produk(
      nama: 'Buah Naga Merah Organik',
      kategori: 'Buah-buahan',
      deskripsi: 'Daging buah ungu merah pekat, antioksidan tinggi menyehatkan',
      harga: 'Rp 26.000 / kg',
      gambar:
          'https://images.unsplash.com/photo-1527325678964-54921661f888?w=300',
      rating: 4.8,
    ),
    Produk(
      nama: 'Stroberi Ciwidey Fresh',
      kategori: 'Buah-buahan',
      deskripsi:
          'Stroberi merah cerah rasa manis asam segar, dipetik dari kebun',
      harga: 'Rp 22.000 / pack',
      gambar:
          'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=300',
      rating: 4.9,
    ),
  ];

  Widget _buildTabList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: _kategoriList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            title: Text(
              _kategoriList[index],
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabListMap() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: _kategoriMapList.length,
      itemBuilder: (context, index) {
        final item = _kategoriMapList[index];
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

  Widget _buildTabModel() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _produkList.length,
      itemBuilder: (context, index) {
        return ListProduk(produk: _produkList[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.format_list_bulleted), text: '1. List'),
              Tab(icon: Icon(Icons.dataset_outlined), text: '2. List<Map>'),
              Tab(icon: Icon(Icons.inventory_2_outlined), text: '3. Model'),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildTabList(), _buildTabListMap(), _buildTabModel()],
        ),
      ),
    );
  }
}
