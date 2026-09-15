import 'package:pelatihan_app_dev/custom_ui/custom_ui_enum.dart';

class CustomUiPenjelasan {
  final String judul;
  final String deskripsi;
  final List<String> poinArsitektur;
  final Map<String, String> parameterPenjelasan;
  final List<String> tipsProduksi;

  const CustomUiPenjelasan({
    required this.judul,
    required this.deskripsi,
    required this.poinArsitektur,
    required this.parameterPenjelasan,
    required this.tipsProduksi,
  });

  static CustomUiPenjelasan getPenjelasan(CustomUiTemplate template) {
    switch (template) {
      case CustomUiTemplate.profileScreen:
        return const CustomUiPenjelasan(
          judul: 'Arsitektur Layar Profil Pengguna Kompleks',
          deskripsi: 'Layar Profil Pengguna menggabungkan header visual dinamis dengan Stack untuk menumpuk cover banner dan CircleAvatar yang menonjol keluar, diikuti oleh kartu ringkasan bio dan grid portofolio bertab.',
          poinArsitektur: [
            'Stack dengan clipBehavior: Clip.none memungkinkan avatar profil melintasi batas bawah cover banner.',
            'Row dengan Expanded mendistribusikan kartu statistik (Pengikut, Mengikuti, Proyek) secara merata dan simetris.',
            'TabBar dengan TabBarView memudahkan pembagian konten antara postingan foto, informasi kontak, dan sertifikasi.',
            'SingleChildScrollView memastikan seluruh konten profil dapat digulir dengan mulus di berbagai resolusi layar.',
          ],
          parameterPenjelasan: {
            'Global Border Radius': 'Mengatur kebulatan sudut kartu statistik, tombol aksi, dan tab bar profil.',
            'Elevation': 'Memberikan efek bayangan pada kartu ringkasan bio dan kartu statistik agar menonjol dari latar belakang.',
            'Dark Mode Toggle': 'Mengubah palet kanvas profil menjadi kontras tinggi untuk kenyamanan membaca di kondisi minim cahaya.',
          },
          tipsProduksi: [
            'Simpan foto cover dengan aspect ratio 16:9 agar tidak terpotong canggung di layar smartphone lebar.',
            'Gunakan Hero widget pada avatar profil saat bertransisi ke halaman pratinjau foto resolusi tinggi.',
          ],
        );

      case CustomUiTemplate.ecommerceDetail:
        return const CustomUiPenjelasan(
          judul: 'Arsitektur Layar Detail E-Commerce & Floating CTA',
          deskripsi: 'Halaman detail produk toko modern yang menyajikan pratinjau produk responsif, indikator badge diskon melayang, selektor varian warna/ukuran interaktif, dan bar pembelian mengambang di bawah.',
          poinArsitektur: [
            'Stack membungkus gambar produk dengan tombol kembali, tombol favorit, dan badge diskon melayang di sudut atas.',
            'Wrap memudahkan penyusunan tombol varian ukuran dan warna secara fleksibel jika jumlah varian bertambah banyak.',
            'Scaffold(bottomNavigationBar) dipakai untuk meletakkan bar pembelian statis agar selalu tampak tanpa menghalangi scroll.',
            'State counter jumlah barang terintegrasi langsung dengan kalkulasi subtotal harga sebelum proses checkout.',
          ],
          parameterPenjelasan: {
            'Selected Option Index': 'Menentukan varian warna atau ukuran produk yang sedang aktif dipilih oleh pembeli.',
            'Cart Quantity': 'Jumlah kuantitas item yang ingin dimasukkan pembeli ke dalam keranjang belanja.',
            'Preset Theme': 'Menyesuaikan karakter warna merek produk (misal: Pastel Sunset untuk fashion, Emerald untuk produk organik).',
          },
          tipsProduksi: [
            'Jangan pernah menyembunyikan tombol beli utama (CTA) di dalam scroll panjang agar konversi penjualan optimal.',
            'Gunakan feedback visual instan seperti SnackBar atau modal sheet saat produk sukses ditambahkan ke keranjang.',
          ],
        );

      case CustomUiTemplate.newsFeed:
        return const CustomUiPenjelasan(
          judul: 'Arsitektur Portal Berita & Feed Artikel',
          deskripsi: 'Struktur portal berita digital yang mengedepankan keterbacaan artikel melalui kartu headline berkontras tinggi dengan overlay gradasi, filter tag kategori horizontal, dan kartu artikel ringkas.',
          poinArsitektur: [
            'LinearGradient overlay dari transparan ke hitam pekat di atas foto headline menjamin teks judul selalu terbaca jelas.',
            'SingleChildScrollView dengan scrollDirection: Axis.horizontal digunakan untuk filter tag kategori yang dapat digeser.',
            'ListTile di dalam Card memudahkan penyusunan thumbnail berita kecil, tanggal publikasi, dan ikon bookmark.',
            'State isBookmarked mengontrol perubahan ikon dan warna secara real-time saat pembaca menyimpan artikel.',
          ],
          parameterPenjelasan: {
            'Is Bookmarked': 'Status penyimpanan artikel berita oleh pengguna (ikon bookmark aktif/non-aktif).',
            'Card Elevation': 'Mengatur ketegasan pemisahan visual antar artikel dalam daftar feed berita.',
            'Dark Mode': 'Sangat direkomendasikan untuk portal berita guna mengurangi kelelahan mata saat membaca teks panjang.',
          },
          tipsProduksi: [
            'Sertakan estimasi waktu baca (misal: 3 Menit Baca) untuk meningkatkan minat pembaca membuka artikel.',
            'Manfaatkan TextOverflow.ellipsis dan maxLines untuk mencegah judul berita yang terlalu panjang merusak grid.',
          ],
        );

      case CustomUiTemplate.dashboardAnalytics:
        return const CustomUiPenjelasan(
          judul: 'Arsitektur Dashboard Analytics & Metrik Keuangan',
          deskripsi: 'Tata letak dashboard visual yang dirancang untuk menyajikan data kunci dalam sekejap, menggabungkan kartu saldo bergradasi, diagram bar mini, dan riwayat mutasi transaksi terstruktur.',
          poinArsitektur: [
            'Container bergradasi linier memberikan kesan modern dan profesional pada kartu saldo utama.',
            'Row dengan Column proporsional digunakan untuk menggambar diagram batang representatif menggunakan Container tinggi dinamis.',
            'ListTile dengan ikon berlingkar latar halus (Container with shape BoxShape.circle) membedakan arus uang masuk dan keluar.',
            'Nilai metrik menggunakan font tebal dengan ukuran 24-28 untuk fokus hierarki visual pertama di layar.',
          ],
          parameterPenjelasan: {
            'Metric Value': 'Angka utama yang ditampilkan secara menonjol pada kartu saldo (misal saldo rekening atau total omset).',
            'Theme Preset': 'Warna Emerald Eco sangat cocok untuk dashboard keuangan, sementara Modern Blue cocok untuk metrik server.',
            'Border Radius': 'Kelengkungan sudut kartu metrik utama agar terlihat lembut dan premium.',
          },
          tipsProduksi: [
            'Berikan opsi untuk menyembunyikan nominal saldo demi privasi pengguna di ruang publik.',
            'Kelompokkan transaksi berdasarkan tanggal (Hari Ini, Kemarin, Minggu Ini) untuk memudahkan navigasi riwayat.',
          ],
        );

      case CustomUiTemplate.formCheckout:
        return const CustomUiPenjelasan(
          judul: 'Arsitektur Formulir Pembayaran & Checkout',
          deskripsi: 'Formulir transaksi komprehensif yang mengelompokkan input alamat pengiriman, kartu pilihan metode pembayaran interaktif, ringkasan rincian biaya, dan tombol aksi konfirmasi pembayaran aman.',
          poinArsitektur: [
            'Pengelompokan form ke dalam section Card yang terpisah memudahkan pengguna memeriksa kelengkapan data.',
            'RadioListTile kustom memberikan kemudahan memilih metode pembayaran (Transfer Bank, Dompet Digital, Kartu Kredit).',
            'Pemisah Divider yang halus menjaga kerapian rincian harga barang, ongkos kirim, dan total tagihan.',
            'Tombol konfirmasi di bagian bawah dilengkapi dengan ikon gembok untuk memberi rasa aman pada transaksi pengguna.',
          ],
          parameterPenjelasan: {
            'Selected Option Index': 'Metode pembayaran aktif yang dipilih oleh pengguna dalam formulir checkout.',
            'Padding': 'Jarak spasi di dalam setiap kartu formulir untuk kenyamanan mengetik dan membaca data.',
            'Elevation': 'Memberikan kontras visual pada rincian tagihan agar berbeda dari kolom input teks.',
          },
          tipsProduksi: [
            'Tampilkan rincian biaya secara transparan sebelum tombol konfirmasi bayar untuk mencegah pembeli membatalkan pesanan.',
            'Validasi seluruh input sebelum mengizinkan tombol pembayaran dapat diklik.',
          ],
        );
    }
  }
}
