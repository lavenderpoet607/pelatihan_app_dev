import 'package:pelatihan_app_dev/custom_widget/custom_widget_enum.dart';

class CustomWidgetPenjelasan {
  final String judul;
  final String deskripsi;
  final List<String> poinKonsep;
  final Map<String, String> parameterPenjelasan;
  final List<String> tipsPenerapan;

  const CustomWidgetPenjelasan({
    required this.judul,
    required this.deskripsi,
    required this.poinKonsep,
    required this.parameterPenjelasan,
    required this.tipsPenerapan,
  });

  static CustomWidgetPenjelasan getPenjelasan(CustomWidgetType type) {
    switch (type) {
      case CustomWidgetType.card:
        return const CustomWidgetPenjelasan(
          judul: 'Arsitektur Custom Card & InkWell',
          deskripsi: 'Custom Card menggabungkan Container dengan BoxDecoration untuk styling visual (sudut tumpul, gradasi, bayangan) dan widget Material + InkWell untuk menghadirkan efek riak sentuh (ripple effect) yang elegan saat ditekan oleh pengguna.',
          poinKonsep: [
            'BoxDecoration memberikan kekuatan manipulasi visual seperti warna solid, gradasi linier, dan batas tepi.',
            'BorderRadius.circular(r) membulatkan sudut keempat sisi secara proporsional.',
            'Material(color: Colors.transparent) diperlukan agar efek ripple dari InkWell tidak tertutup oleh dekorasi container.',
            'BoxShadow memberikan ilusi kedalaman visual (depth/elevasi) pada UI datar.',
          ],
          parameterPenjelasan: {
            'Border Radius': 'Mengontrol tingkat kelengkungan sudut kartu. Nilai yang lebih tinggi (16-24) memberikan nuansa modern dan ramah.',
            'Padding': 'Memberikan ruang nafas di dalam kartu agar teks dan ikon tidak menempel ke tepi batas.',
            'Elevation & Shadow': 'Menentukan seberapa tinggi kartu melayang dari permukaan latar belakang melalui blurRadius dan offset sumbu Y.',
            'LinearGradient': 'Pencampuran dua warna tematik dari sudut kiri atas ke kanan bawah untuk estetika visual dinamis.',
            'Action Type': 'Callback fungsi yang dieksekusi saat kartu ditekan (misalnya menampilkan SnackBar notifikasi atau dialog konfirmasi).',
          },
          tipsPenerapan: [
            'Gunakan kartu bergradasi untuk menonjolkan fitur unggulan atau status keanggotaan.',
            'Pastikan kontras teks cukup tinggi terhadap warna latar kartu agar mudah dibaca.',
            'Bungkus konten di dalam Expanded saat menggunakan Row agar teks panjang tidak mengalami overflow.',
          ],
        );
      case CustomWidgetType.button:
        return const CustomWidgetPenjelasan(
          judul: 'Arsitektur Custom Button & Feedback Interaksi',
          deskripsi: 'Custom Button dirancang untuk memberikan umpan balik sentuhan instan dengan gaya yang dapat diubah antara Solid, Outlined, dan Bergradasi. Tombol ini juga dapat dikonfigurasi untuk menampilkan indikator loading saat proses asinkron berjalan.',
          poinKonsep: [
            'ElevatedButton.icon memudahkan penempatan ikon dan teks secara berdampingan dengan jarak standar.',
            'ElevatedButton.styleFrom memungkinkan pengaturan warna latar, warna font, padding, dan bentuk border.',
            'Nilai onPressed: null secara otomatis mengubah tombol ke status non-aktif (disabled) dengan opacity redup.',
            'Indikator CircularProgressIndicator dapat menggantikan label tombol ketika status isLoading aktif.',
          ],
          parameterPenjelasan: {
            'Border Radius': 'Mengubah tombol dari bentuk persegi kaku (0) menjadi kapsul melengkung (24-30).',
            'Padding Vertikal': 'Menentukan tinggi area sentuh tombol (touch target) agar nyaman ditekan jari pengguna.',
            'Is Outlined': 'Menghasilkan tombol sekunder dengan batas garis luar tanpa warna latar yang mencolok.',
            'Gradient Background': 'Membungkus tombol di dalam Container bergradasi dengan latar transparan pada ElevatedButton.',
            'Is Active': 'Mengontrol ketersediaan aksi tombol. Jika false, pengguna tidak dapat menekan tombol.',
          },
          tipsPenerapan: [
            'Terapkan tombol bergradasi hanya untuk Call-to-Action (CTA) utama di halaman.',
            'Sediakan minimal ukuran 48x48 pixel logis untuk area sentuh tombol sesuai panduan aksesibilitas Material Design.',
          ],
        );
      case CustomWidgetType.inputField:
        return const CustomWidgetPenjelasan(
          judul: 'Arsitektur Custom TextField & Validasi Input',
          deskripsi: 'Custom TextField mengkustomisasi InputDecoration dengan border melengkung halus, ikon prefix tematik, warna latar yang lembut, serta styling state saat kolom sedang difokuskan untuk mengetik.',
          poinKonsep: [
            'InputDecoration mengontrol seluruh dekorasi visual di sekitar input teks.',
            'OutlineInputBorder membungkus kotak masukan secara penuh dengan batas sudut kustom.',
            'focusedBorder memberikan respon visual dengan mengubah warna dan ketebalan garis saat pengguna mengetik.',
            'prefixIcon dan suffixIcon memperjelas maksud kolom input (misal: ikon orang untuk nama, gembok untuk kata sandi).',
          ],
          parameterPenjelasan: {
            'Border Radius': 'Kelengkungan sudut garis luar kotak teks agar serasi dengan gaya kartu aplikasi.',
            'Filled & FillColor': 'Mengisi bagian dalam kolom input dengan warna latar lembut agar lebih kontras di atas kanvas putih.',
            'Prefix Icon': 'Ikon penunjuk fungsi di sisi kiri kolom teks yang memandu pemahaman instan pengguna.',
            'Action Type (onChanged)': 'Event yang dipicu setiap kali karakter huruf berubah di dalam kotak teks.',
          },
          tipsPenerapan: [
            'Gunakan hintText sebagai contoh format masukan yang diharapkan.',
            'Kombinasikan dengan TextEditingController jika Anda memerlukan kontrol penuh terhadap isi teks atau pembersihan kolom.',
          ],
        );
      case CustomWidgetType.avatar:
        return const CustomWidgetPenjelasan(
          judul: 'Arsitektur Custom Avatar & Status Badge',
          deskripsi: 'Custom Avatar memadukan CircleAvatar dengan Stack dan Positioned untuk meletakkan indikator status (misalnya Online atau Offline) di sudut kanan bawah avatar secara presisi.',
          poinKonsep: [
            'Stack menumpuk widget anak secara berlapis di atas satu sama lain.',
            'Positioned menempatkan badge status di koordinat tertentu dari tepi container pembungkus.',
            'BoxShape.circle memotong Container dan border menjadi lingkaran simetris sempurna.',
            'BoxShadow di sekitar avatar menghasilkan efek glow atau elevasi yang membedakannya dari latar.',
          ],
          parameterPenjelasan: {
            'Border Radius (Radius Lingkaran)':
                'Menentukan diameter ukuran avatar profil pengguna.',
            'Padding Outer Ring': 'Jarak ketebalan lingkaran cincin luar bergradasi yang membingkai foto avatar.',
            'Is Active (Status Dot)': 'Mengubah warna badge status: hijau untuk aktif/online, abu-abu untuk offline.',
            'Action Type (onTap)': 'Event ketukan pada avatar (misalnya untuk membuka galeri foto atau profil detail).',
          },
          tipsPenerapan: [
            'Gunakan inisial teks atau ikon cadangan jika gambar dari jaringan gagal dimuat.',
            'Beri batas tepi putih (border: Border.all(color: Colors.white, width: 2)) pada badge status agar terpisah jelas dari avatar.',
          ],
        );
      case CustomWidgetType.banner:
        return const CustomWidgetPenjelasan(
          judul: 'Arsitektur Custom Alert Banner',
          deskripsi: 'Custom Alert Banner menyajikan kartu pengumuman atau notifikasi penting yang kompak dengan perpaduan warna latar ber-opacity lembut, ikon status, dan tombol dismiss interaktif.',
          poinKonsep: [
            'Warna latar dengan opasitas rendah (withOpacity(0.12)) memberikan efek highlight yang ramah di mata.',
            'Border tipis yang senada dengan warna aksen mempertegas area notifikasi.',
            'IconButton di ujung kanan memudahkan pengguna untuk menutup atau menyembunyikan banner.',
            'Row dengan Expanded menjaga pesan teks tetap rapi tanpa menabrak tombol aksi.',
          ],
          parameterPenjelasan: {
            'Border Radius': 'Kelengkungan sudut tepi banner agar menyatu dengan estetika aplikasi.',
            'Color Theme': 'Menentukan nada pesan: Kuning Amber untuk peringatan, Hijau Emerald untuk sukses, Merah Rose untuk kesalahan, Biru untuk info.',
            'Action Type': 'Fungsi yang dipanggil saat tombol tutup ditekan atau banner disentuh.',
          },
          tipsPenerapan: [
            'Tempatkan alert banner di bagian atas halaman formulir untuk memberikan panduan umum.',
            'Gunakan kata-kata ringkas dan padat agar informasi dapat ditangkap dalam sekali lirik.',
          ],
        );
    }
  }
}
