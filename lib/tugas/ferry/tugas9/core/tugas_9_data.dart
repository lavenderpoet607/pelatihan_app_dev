import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/core/tugas_9_model_produk.dart';

const List<String> kategoriList = [
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

const List<Map<String, dynamic>> kategoriMapList = [
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

const List<Produk> produkList = [
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
    deskripsi: 'Mangga matang pohon asli Probolinggo, aroma harum manis legit',
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
    deskripsi: 'Stroberi merah cerah rasa manis asam segar, dipetik dari kebun',
    harga: 'Rp 22.000 / pack',
    gambar:
        'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=300',
    rating: 4.9,
  ),
];
