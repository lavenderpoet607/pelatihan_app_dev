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
