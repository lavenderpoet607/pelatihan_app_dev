import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_bottom_navigator.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_column.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_drawer.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_listview.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_navigasi.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_rich_text.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_row.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_scaffold.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_singlechildscorollview.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_stateful.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_textfield.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_widget_circle_avatar.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_widget_icon.dart';
import 'package:pelatihan_app_dev/penjelasan/penjelasan_model.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas_3.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas_5_button.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas_8.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_syarat_dan_ketentuan.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas_1_Widget.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas_2_layout.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas_3_register.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas_4_listView.dart';
import 'package:pelatihan_app_dev/custom_widget/halaman_custom_widget.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/halaman_latihan_login_db.dart';

final List<PenjelasanItem> daftarPenjelasan = [
  PenjelasanItem(
    title: 'Latihan Scaffold',
    subtitle: 'Belajar struktur dasar halaman dan body',
    kategori: 'Latihan',
    icon: Icons.view_quilt_rounded,
    color: Colors.blue,
    deskripsi: 'Scaffold adalah widget kerangka dasar dalam Material Design yang menyediakan struktur visual standar seperti AppBar, Body, Drawer, FloatingActionButton, dan BottomNavigationBar. Pada latihan ini, Scaffold menampung AppBar dan Body responsif menggunakan LayoutBuilder.',
    poinPenting: [
      'Scaffold menyediakan struktur layout dasar Material Design',
      'AppBar digunakan sebagai navigasi atas dengan title dan actions',
      'Body merupakan area utama untuk menampilkan konten aplikasi',
      'LayoutBuilder dan ConstrainedBox memastikan tata letak responsif',
    ],
    cropKode: '''Scaffold(
  appBar: AppBar(
    title: const Text('Belajar Scaffold'),
    backgroundColor: Colors.blue,
  ),
  body: LayoutBuilder(
    builder: (context, constraints) {
      final boxSize = constraints.maxHeight * 0.5;
      final size = boxSize.clamp(0.0, 200.0);
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight - 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepPurple, width: 3),
                ),
                child: const Center(child: Text('JMK 48')),
              ),
              const SizedBox(height: 16),
              const Text(
                'Kamu berada di dalam body scaffold',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  ),
)''',
    halaman: const LatihanScaffold(),
  ),
  PenjelasanItem(
    title: 'Latihan Column',
    subtitle: 'Menyusun widget secara vertikal',
    kategori: 'Latihan',
    icon: Icons.view_column_rounded,
    color: Colors.indigo,
    deskripsi: 'Column adalah widget layout linear yang mengatur widget-widget turunannya (children) secara vertikal dari atas ke bawah. Latihan ini mendemonstrasikan penyusunan beberapa baris teks di dalam Column yang dibungkus SingleChildScrollView agar tidak terjadi overflow.',
    poinPenting: [
      'Column menyusun widget turunan secara vertikal dari atas ke bawah',
      'MainAxisAlignment mengatur perataan pada sumbu vertikal',
      'CrossAxisAlignment mengatur perataan pada sumbu horizontal',
      'Children menerima daftar widget dalam bentuk List<Widget>',
    ],
    cropKode: '''Column(
  children: const [
    Text('Hallo text ini berada di baris pertama'),
    Text('Hallo text ini berada di baris kedua'),
    Text('Hallo text ini berada di baris ketiga'),
    Text('Hallo text ini berada di baris keempat'),
    Text('Hallo text ini berada di baris kelima'),
  ],
)''',
    halaman: const LatihanColumn(),
  ),
  PenjelasanItem(
    title: 'Latihan Row',
    subtitle: 'Menyusun widget secara horizontal',
    kategori: 'Latihan',
    icon: Icons.view_stream_rounded,
    color: Colors.teal,
    deskripsi: 'Row adalah widget layout linear yang mengatur turunan secara horizontal dari kiri ke kanan. Sumbu utamanya adalah horizontal (MainAxis), dan sumbu silangnya vertikal (CrossAxis). Digunakan bersama SizedBox sebagai pemberi jarak spasi antar elemen.',
    poinPenting: [
      'Row menata widget turunan secara berjejer menyamping',
      'MainAxisAlignment.center menempatkan elemen di tengah horizontal',
      'SizedBox(width: 8) memberikan jarak horizontal antar elemen',
      'SingleChildScrollView(scrollDirection: Axis.horizontal) mencegah overflow layar sempit',
    ],
    cropKode: '''Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Text('Ini text widget kiri', style: TextStyle(color: Colors.black)),
    SizedBox(width: 8),
    Text('Ini text widget tengah', style: TextStyle(color: Colors.black)),
    SizedBox(width: 8),
    Text('Ini text widget kanan', style: TextStyle(color: Colors.black)),
  ],
)''',
    halaman: const LatihanRow(),
  ),
  PenjelasanItem(
    title: 'Latihan RichText',
    subtitle: 'Kustomisasi format dan warna teks',
    kategori: 'Latihan',
    icon: Icons.text_fields_rounded,
    color: Colors.deepOrange,
    deskripsi: 'RichText memungkinkan pembuatan satu paragraf teks dengan beragam format, gaya, warna font, ketebalan, dan ukuran yang berbeda-beda dalam satu rangkaian menggunakan struktur TextSpan bersarang.',
    poinPenting: [
      'RichText menampilkan teks dengan beragam gaya visual dalam satu baris',
      'TextSpan menampung properti teks dan style spesifik',
      'Children di TextSpan memungkinkan variasi potongan kata berikutnya',
      'Dapat menggabungkan warna, ukuran, dan fontStyle dalam satu kalimat',
    ],
    cropKode: '''RichText(
  text: const TextSpan(
    text: 'Belajar widget RichText: ',
    style: TextStyle(color: Colors.white),
    children: <TextSpan>[
      TextSpan(
        text: 'Belajar ',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: 'Flutter ',
        style: TextStyle(color: Color.fromARGB(255, 18, 14, 241), fontStyle: FontStyle.italic),
      ),
      TextSpan(
        text: 'itu ',
        style: TextStyle(color: Color.fromARGB(255, 10, 10, 10), fontStyle: FontStyle.italic),
      ),
      TextSpan(
        text: 'Mudah',
        style: TextStyle(color: Color.fromARGB(255, 14, 241, 63), fontStyle: FontStyle.italic),
      ),
    ],
  ),
)''',
    halaman: const LatihanRichText(),
  ),
  PenjelasanItem(
    title: 'Latihan Icon',
    subtitle: 'Menampilkan berbagai macam ikon',
    kategori: 'Latihan',
    icon: Icons.emoji_symbols_rounded,
    color: Colors.pink,
    deskripsi: 'Widget Icon digunakan untuk menampilkan simbol grafik visual dari koleksi pustaka Icons Material. Icon dapat dikustomisasi ukuran (size) dan warnanya (color), serta dapat dibungkus dengan IconButton untuk interaksi sentuh pengguna.',
    poinPenting: [
      'Widget Icon mengambil simbol visual dari pustaka Icons',
      'Parameter color mengatur warna ikon',
      'Parameter size menentukan dimensi ukuran ikon dalam pixel logis',
      'IconButton menggabungkan widget Icon dengan callback penekanan onPressed',
    ],
    cropKode: '''AppBar(
  title: const Text('Belajar widget Icon'),
  backgroundColor: const Color.fromARGB(255, 236, 42, 227),
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.pop(context),
  ),
  actions: const [
    Icon(Icons.view_headline, color: Color.fromARGB(255, 7, 7, 7), size: 50),
  ],
)''',
    halaman: const LatihanWidgetIcon(),
  ),
  PenjelasanItem(
    title: 'Latihan CircleAvatar',
    subtitle: 'Menampilkan avatar profil melingkar',
    kategori: 'Latihan',
    icon: Icons.account_circle_rounded,
    color: Colors.purple,
    deskripsi: 'CircleAvatar adalah widget praktis berbentuk lingkaran yang umumnya difungsikan untuk menampilkan gambar foto profil pengguna, inisial huruf, atau ikon pengguna dengan radius lengkungan tertentu.',
    poinPenting: [
      'CircleAvatar otomatis memotong gambar atau latar menjadi lingkaran sempurna',
      'Radius menentukan jari-jari ukuran lingkaran',
      'backgroundImage menerima ImageProvider seperti NetworkImage atau AssetImage',
      'Dapat diisi child widget jika gambar gagal atau untuk inisial nama',
    ],
    cropKode: '''Center(
  child: CircleAvatar(
    radius: 100,
    backgroundImage: NetworkImage(
      'https://i.pinimg.com/736x/e5/25/c9/e525c91d9c8fb7ca98f2cc81db0a4d4b.jpg',
    ),
  ),
)''',
    halaman: const LatihanWidgetCircleAvatar(),
  ),
  PenjelasanItem(
    title: 'Latihan Single Child Scroll View',
    subtitle: 'Mengubah agar halaman bisa menjadi scrollable',
    kategori: 'Latihan',
    icon: Icons.child_care_outlined,
    color: const Color.fromARGB(255, 255, 0, 0),
    deskripsi: 'SingleChildScrollView membungkus satu widget turunan (seperti Column) agar konten dapat digulir ketika melebihi batas ukuran viewport layar perangkat, sehingga menghindari galat RenderFlex overflow.',
    poinPenting: [
      'Mencegah error overflow layar saat orientasi berubah atau keyboard muncul',
      'Hanya menerima satu widget turunan utama (child)',
      'scrollDirection dapat diatur vertikal (Axis.vertical) atau horizontal',
      'Dapat dipadukan dengan TextOverflow.ellipsis untuk teks panjang',
    ],
    cropKode: '''SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.amberAccent.withAlpha(30),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.assignment, color: Colors.amberAccent, size: 26),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Text(
          'TUGAS MANDIRI - Uji fitur Text Overflow dengan batas elipsis',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    ],
  ),
)''',
    halaman: const LatihanSinglechildscorollview(),
  ),
  PenjelasanItem(
    title: 'Latihan List View',
    subtitle: 'Menjadikan Subjek menjadi list dalam view',
    kategori: 'Latihan',
    icon: Icons.line_style,
    color: const Color.fromARGB(255, 74, 145, 238),
    deskripsi: 'ListView adalah widget linear yang dapat digulir dan menampilkan koleksi widget anak berurutan. Sangat cocok dipasangkan dengan ListTile untuk menampilkan daftar kontak, pesan, atau riwayat yang rapi.',
    poinPenting: [
      'ListView menyajikan sekumpulan widget dalam daftar scrollable',
      'ListTile menyediakan struktur leading, title, subtitle, dan trailing',
      'Card memberikan efek elevasi dan batas melengkung pada setiap baris item',
      'Mudah digunakan untuk daftar data statis maupun dinamis',
    ],
    cropKode: '''ListView(
  padding: const EdgeInsets.all(12),
  children: [
    Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          child: const Icon(Icons.person, color: Colors.teal),
        ),
        title: const Text('Item 1: Ridho'),
        subtitle: const Text('Mobile Developer - Flutter'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    ),
  ],
)''',
    halaman: const LatihanListview(),
  ),
  PenjelasanItem(
    title: 'Latihan TextField',
    subtitle: 'Menjadikan Subjek menjadi text yang bisa di input',
    kategori: 'Latihan',
    icon: Icons.text_fields,
    color: const Color.fromARGB(255, 74, 145, 238),
    deskripsi: 'TextField adalah input teks utama di Flutter yang memungkinkan pengguna mengetik teks melalui keyboard virtual. Dilengkapi dekorasi InputDecoration seperti label, hint, ikon prefix, dan border kotak.',
    poinPenting: [
      'TextField menerima input masukan teks dari pengguna',
      'InputDecoration mengatur gaya visual kotak input teks',
      'OutlineInputBorder memberikan garis batas di sekeliling kotak input',
      'labelText memberikan label judul yang melayang saat input fokus',
    ],
    cropKode: '''TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'jawa-jawa',
    hintText: 'Enter a search term',
  ),
)''',
    halaman: const LatihanTextfield(),
  ),
  PenjelasanItem(
    title: 'Latihan StatefulWidget',
    subtitle: 'Belajar manajemen state dinamis & counter',
    kategori: 'Latihan',
    icon: Icons.touch_app_rounded,
    color: Colors.blueAccent,
    deskripsi: 'StatefulWidget adalah widget yang memiliki data yang dapat berubah selama masa hidupnya (mutable state). Pemanggilan fungsi setState() memberi tahu framework Flutter untuk merender ulang UI dengan nilai data terbaru.',
    poinPenting: [
      'StatefulWidget digunakan ketika tampilan UI dapat berubah saat berinteraksi',
      'Class State mengelola variabel data internal widget',
      'setState() memicu re-render method build() dengan nilai baru',
      'Digunakan untuk aksi penambahan counter, pengurangan, dan reset',
    ],
    cropKode: '''class _LatihanStatefulState extends State<LatihanStateful> {
  int _counter = 0;

  void _tambah() {
    setState(() {
      _counter++;
    });
  }

  void _kurang() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }
}''',
    halaman: const LatihanStateful(),
  ),
  PenjelasanItem(
    title: 'Latihan Bottom Navigator',
    subtitle: 'Belajar Bottom Navigator',
    kategori: 'Latihan',
    icon: Icons.navigation,
    color: Colors.deepPurple,
    deskripsi: 'BottomNavigationBar adalah bilah navigasi di bagian bawah layar yang memudahkan berpindah antar tampilan utama aplikasi. Dipadukan dengan enum BottomNavTab dan IndexedStack agar state halaman tetap terjaga saat tab berganti.',
    poinPenting: [
      'BottomNavigationBar menampilkan menu navigasi di bagian bawah layar',
      'Enum BottomNavTab menentukan label, ikon, dan widget tiap halaman secara terstruktur',
      'currentIndex mengindikasikan posisi tab aktif saat ini',
      'IndexedStack menjaga state halaman agar tidak ter-reset saat berpindah tab',
    ],
    cropKode: '''Scaffold(
  appBar: AppBar(
    title: Text("Latihan Bottom Navigator: \${_currentTab.label}"),
    backgroundColor: Colors.amberAccent,
  ),
  body: IndexedStack(
    index: _currentTab.index,
    children: BottomNavTab.values.map((tab) => tab.page).toList(),
  ),
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentTab.index,
    onTap: (index) {
      setState(() {
        _currentTab = BottomNavTab.values[index];
      });
    },
    items: BottomNavTab.values.map((tab) {
      return BottomNavigationBarItem(
        icon: Icon(tab.icon),
        activeIcon: Icon(tab.activeIcon),
        label: tab.label,
      );
    }).toList(),
  ),
)''',
    halaman: const LatihanBottomNavigator(),
  ),
  PenjelasanItem(
    title: 'Latihan Drawer',
    subtitle: 'Belajar navigasi drawer dengan UserAccountsDrawerHeader',
    kategori: 'Latihan',
    icon: Icons.menu_open_rounded,
    color: Colors.blue,
    deskripsi: 'Drawer adalah panel menu navigasi yang bergeser masuk dari sisi samping layar. Di dalamnya terdapat UserAccountsDrawerHeader untuk menampilkan profil serta email pengguna, dipadukan dengan enum LatihanDrawerPage untuk navigasi halaman terpisah.',
    poinPenting: [
      'Drawer menyediakan menu navigasi geser samping yang intuitif',
      'UserAccountsDrawerHeader menampilkan info profil akun pengguna',
      'ListTile digunakan sebagai tombol pemilihan menu',
      'Enum LatihanDrawerPage menghubungkan menu dengan sub-halaman tujuan',
    ],
    cropKode: '''Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      UserAccountsDrawerHeader(
        accountName: const Text('Ridho'),
        accountEmail: const Text('ridho@pelatihan.com'),
        currentAccountPicture: const CircleAvatar(
          backgroundImage: NetworkImage('https://i.pinimg.com/...'),
        ),
      ),
      ...LatihanDrawerPage.values.map(
        (page) => ListTile(
          leading: Icon(page.icon),
          title: Text(page.title),
          selected: selectedPage == page,
          onTap: () => onPageSelected(page),
        ),
      ),
    ],
  ),
)''',
    halaman: const LatihanDrawer(),
  ),
  PenjelasanItem(
    title: 'Latihan Navigasi',
    subtitle: 'Belajar 4 metode navigasi: push, pushNamed, pushReplacement, pushAndRemoveUntil',
    kategori: 'Latihan',
    icon: Icons.alt_route_rounded,
    color: Colors.deepPurple,
    deskripsi: 'Mendemonstrasikan 4 metode navigasi utama dalam Flutter: Navigator.push untuk menumpuk rute baru di atas stack, Navigator.pushNamed untuk navigasi berbasis nama rute terdaftar, Navigator.pushReplacement untuk menggantikan rute aktif saat ini, dan Navigator.pushAndRemoveUntil untuk mengosongkan seluruh tumpukan riwayat rute sebelumnya.',
    poinPenting: [
      'Navigator.push: Menumpuk rute baru ke atas tumpukan navigasi',
      'Navigator.pushNamed: Berpindah rute berdasarkan path String yang terdaftar',
      'Navigator.pushReplacement: Menghapus rute aktif sekarang dan menggantinya dengan halaman baru',
      'Navigator.pushAndRemoveUntil: Menghapus tumpukan halaman lama hingga kondisi terpenuhi',
    ],
    cropKode: '''void _metodePush(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const HalamanTujuanNavigasi(metode: MetodeNavigasi.push),
    ),
  );
}

void _metodePushNamed(BuildContext context) {
  Navigator.pushNamed(context, '/tujuan_navigasi');
}

void _metodePushReplacement(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const HalamanTujuanNavigasi(metode: MetodeNavigasi.pushReplacement),
    ),
  );
}

void _metodePushAndRemoveUntil(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const HalamanTujuanNavigasi(metode: MetodeNavigasi.pushAndRemoveUntil),
    ),
    (route) => false,
  );
}''',
    halaman: const LatihanNavigasi(),
  ),

  PenjelasanItem(
    title: 'Tugas: Profil Saya',
    subtitle: 'Biodata diri, foto profil, dan info kontak',
    kategori: 'Tugas',
    icon: Icons.person_rounded,
    color: const Color(0xFF6366F1),
    deskripsi: 'Halaman profil diri interaktif yang menampilkan foto profil pengguna dalam CircleAvatar, teks nama besar dengan gaya kustom Milky Cream, serta daftar informasi kontak (alamat, email, telepon) menggunakan komposisi baris Row dan Icon.',
    poinPenting: [
      'CircleAvatar untuk menampilkan avatar profil berlingkar halus',
      'Column & Row untuk menyusun informasi teks dan ikon secara teratur',
      'SingleChildScrollView memastikan seluruh konten profil dapat di-scroll tanpa overflow',
      'Integrasi font lokal dan warna tema khusus',
    ],
    cropKode: '''Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Center(
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
          'https://i.pinimg.com/736x/e5/25/c9/e525c91d9c8fb7ca98f2cc81db0a4d4b.jpg',
        ),
      ),
    ),
    const SizedBox(height: 10),
    const Text(
      'Nama: Ridho Dibaja Tawang',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Icon(Icons.location_on),
        SizedBox(width: 10),
        Expanded(
          child: Text('Alamat: Jl. Kebon Sayur 1 BidacaraCina', style: TextStyle(fontSize: 18)),
        ),
      ],
    ),
  ],
)''',
    halaman: const Tugas1Widget(),
  ),
  PenjelasanItem(
    title: 'Tugas: Layout Flutter Detail Toko',
    subtitle: 'Harumony Mystic Emporium - Toko buku',
    kategori: 'Tugas',
    icon: Icons.storefront_rounded,
    color: const Color(0xFFEC4899),
    deskripsi: 'Layout komprehensif untuk halaman detail toko buku Harumony Mystic Emporium, menyusun kartu informasi kontak email, deskripsi toko, grid etalase, dan ornamen visual bertema warna pastel.',
    poinPenting: [
      'Kombinasi Container dengan BoxDecoration gradasi dan border melengkung',
      'Struktur informasi toko menggunakan Row dan Column yang berjenjang',
      'Penataan ikon komunikasi dan tombol aksi cepat untuk interaksi pengguna',
      'SingleChildScrollView untuk pengalaman penjelajahan katalog yang mulus',
    ],
    cropKode: '''Container(
  width: double.infinity,
  height: 45,
  decoration: BoxDecoration(
    color: Colors.pink[400],
    borderRadius: BorderRadius.circular(15),
  ),
  child: Row(
    children: const [
      SizedBox(width: 15),
      Icon(Icons.email, color: Colors.black, size: 18),
      SizedBox(width: 15),
      Text(
        "harumony.id",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    ],
  ),
)''',
    halaman: const Tugas2Layout(),
  ),
  PenjelasanItem(
    title: 'Tugas: Luminous News',
    subtitle: 'Portal artikel & berita masa depan',
    kategori: 'Tugas',
    icon: Icons.newspaper_rounded,
    color: const Color(0xFF06B6D4),
    deskripsi: 'Aplikasi portal berita futuristik Luminous News dengan judul artikel tebal, gambar sampul berteknologi tinggi yang dipotong melengkung dengan ClipRRect, metadata penulis, dan paragraf isi artikel berita.',
    poinPenting: [
      'AppBar dengan kombinasi judul, ikon, dan CircleAvatar profil',
      'ClipRRect untuk memotong sudut gambar berita dengan radius halus',
      'Tipografi berita artikel dengan perataan tinggi baris yang optimal',
      'SingleChildScrollView untuk membaca artikel panjang tanpa batas viewport',
    ],
    cropKode: '''AppBar(
  backgroundColor: Colors.white,
  elevation: 1,
  title: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Text(
          "Luminous News",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color.fromRGBO(112, 196, 252, 1),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
          ),
        ),
      ),
      CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(
          'https://i.pinimg.com/736x/e5/25/c9/e525c91d9c8fb7ca98f2cc81db0a4d4b.jpg',
        ),
      ),
    ],
  ),
)''',
    halaman: const Tugas3Lumi(),
  ),
  PenjelasanItem(
    title: 'Tugas: Form Input & Penataan Grid',
    subtitle: 'Layouting Lanjutan',
    kategori: 'Tugas',
    icon: Icons.input_rounded,
    color: const Color(0xFFF97316),
    deskripsi: 'Desain layout lanjutan yang menggabungkan formulir pendaftaran interaktif (berisi kolom Nama, Kontak, Nomor Telepon, Alamat) dan penataan etalase produk menggunakan grid dengan kartu visual dan tombol aksi.',
    poinPenting: [
      'Integrasi form input TextField dengan prefixIcon tematik',
      'Pemformatan OutlineInputBorder pada setiap kolom input',
      'Pemisahan bagian form dan penataan konten produk',
      'Struktur SingleChildScrollView menampung formulir panjang',
    ],
    cropKode: '''TextField(
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(),
    labelText: 'Name',
    hintText: 'Enter YourName',
  ),
)''',
    halaman: const Tugas3(),
  ),
  PenjelasanItem(
    title: 'Tugas: ListView & ListTile',
    subtitle: 'Optimalisasi Daftar dengan ListView & ListTile',
    kategori: 'Tugas',
    icon: Icons.view_list_rounded,
    color: const Color(0xFF10B981),
    deskripsi: 'Penerapan ListView yang efisien untuk menyajikan deretan formulir data serta daftar item berulang secara terstruktur menggunakan ListTile yang dibungkus dalam Card dengan elevasi rapi.',
    poinPenting: [
      'ListView untuk scroll performan tanpa hambatan rendering',
      'Card memberikan pemisahan visual antar elemen yang jelas',
      'ListTile memiliki properti leading, title, subtitle, dan trailing',
      'Penataan struktur gabungan form input dan daftar data sekaligus',
    ],
    cropKode: '''ListView(
  children: const [
    Text("--- Bagian Form ---"),
    SizedBox(height: 10),
    TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
        labelText: 'Name',
        hintText: 'Enter YourName',
      ),
    ),
  ],
)''',
    halaman: const Tugas4(),
  ),
  PenjelasanItem(
    title: 'Tugas: Event Handling',
    subtitle: 'Interaksi Pengguna & Event Handling',
    kategori: 'Tugas',
    icon: Icons.event_rounded,
    color: const Color(0xFFF59E0B),
    deskripsi: 'Eksplorasi mendalam berbagai macam tombol dan interaksi event di Flutter, meliputi ElevatedButton, IconButton dengan toggle status favorit, TextButton, InkWell dengan efek ripple, serta manipulasi state angka.',
    poinPenting: [
      'ElevatedButton untuk tombol aksi primer yang menonjol',
      'IconButton dengan toggle icon berwarna merah saat disukai',
      'InkWell untuk mendeteksi gestur ketukan pada widget sembarang dengan efek riak',
      'setState merubah kondisi bool dan integer secara real-time',
    ],
    cropKode: '''ElevatedButton(
  onPressed: () {
    setState(() {
      _showText = !_showText;
    });
  },
  child: const Text("Klik Saya!"),
)

IconButton(
  onPressed: () {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  },
  icon: Icon(
    Icons.favorite,
    color: _isFavorite ? Colors.red : Colors.grey,
  ),
)''',
    halaman: const Tugas5(),
  ),
  PenjelasanItem(
    title: 'Tugas: Form Input',
    subtitle: 'Interaktif dengan Navigasi Drawer',
    kategori: 'Tugas',
    icon: Icons.text_format_rounded,
    color: const Color(0xFFF59E0B),
    deskripsi: 'Aplikasi interaktif yang memisahkan form input ke dalam file modular terpisah: Syarat & Ketentuan (CheckboxListTile), Tanggal Lahir (DatePicker showDatePicker), Pengingat Notifikasi (SwitchListTile), Mode Gelap (Switch), dan Kategori (RadioListTile).',
    poinPenting: [
      'Arsitektur file terpisah untuk setiap fungsi form secara modular',
      'Drawer navigasi untuk berpindah antar fungsi input',
      'Manajemen tema terang & gelap yang tersinkronisasi',
      'Penanganan berbagai tipe input: Checkbox, Switch, DatePicker, Radio',
    ],
    cropKode: '''CheckboxListTile(
  title: const Text('Saya menyetujui semua syarat dan ketentuan'),
  value: _isChecked,
  onChanged: (bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  },
)

SwitchListTile(
  title: const Text('Aktifkan Notifikasi Pengingat'),
  value: _pengingatAktif,
  onChanged: (bool value) {
    setState(() {
      _pengingatAktif = value;
    });
  },
)''',
    halaman: Tugas7(onThemeChanged: (_) {}, isDarkMode: false),
  ),
  PenjelasanItem(
    title: 'Tugas: Navigasi Bawah (Bottom Nav)',
    subtitle: 'BottomNavigationBar & Conditional Drawer (Ridho)',
    kategori: 'Tugas',
    icon: Icons.tab_rounded,
    color: const Color(0xFF0284C7),
    deskripsi: 'Aplikasi canggih yang memadukan BottomNavigationBar dengan Drawer Bersyarat (Conditional Drawer). Drawer hanya aktif di Tab Home (Form Registrasi), dan otomatis dinonaktifkan di Tab Tentang Aplikasi menggunakan enum Tugas8Tab.',
    poinPenting: [
      'Conditional Drawer: drawer aktif bersyarat berdasarkan tab terpilih (_currentTab == Tugas8Tab.home ? Drawer : null)',
      'Enum Tugas8Tab mengelola judul AppBar, ikon tab, dan widget body secara terpusat',
      'Pemisahan file modular: Form Input, Drawer, Tentang Aplikasi, dan Widgets',
      'BottomNavigationBar dengan feedback visual yang dinamis',
    ],
    cropKode: '''Scaffold(
  appBar: AppBar(
    title: Text(_currentTab.appBarTitle),
    backgroundColor: const Color(0xFF0284C7),
  ),
  drawer: _currentTab == Tugas8Tab.home
      ? Tugas8Drawer(
          onThemeChanged: widget.onThemeChanged,
          isDarkMode: widget.isDarkMode,
        )
      : null,
  body: _currentTab.view,
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentTab.index,
    onTap: (index) {
      setState(() {
        _currentTab = Tugas8Tab.values[index];
      });
    },
    items: Tugas8Tab.values
        .map((tab) => BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.label))
        .toList(),
  ),
)''',
    halaman: Tugas8(onThemeChanged: (_) {}, isDarkMode: false),
  ),
  PenjelasanItem(
    title: 'Tugas: Daftar Kategori',
    subtitle: 'ListView.builder: List, Map, dan Model',
    kategori: 'Tugas',
    icon: Icons.list_alt_rounded,
    color: const Color(0xFF10B981),
    deskripsi: 'Implementasi ListView.builder tingkat lanjut yang membandingkan 3 teknik pengelolaan data dalam TabBar menggunakan enum Tugas9Tab: Tab 1 menggunakan List String biasa, Tab 2 menggunakan List of Map<String, dynamic>, dan Tab 3 menggunakan Data Model Object (Produk) dengan Custom Card Widget modular.',
    poinPenting: [
      'ListView.builder membangun widget secara lazy hanya saat tampak di layar',
      'Perbandingan 3 pendekatan struktur data: List, Map, dan Data Model',
      'Custom Card Widget modular untuk arsitektur kode yang bersih dan terisolasi',
      'Enum Tugas9Tab mengontrol navigasi tab dan widget konten secara type-safe',
    ],
    cropKode: '''ListView.builder(
  padding: const EdgeInsets.all(12),
  itemCount: daftarProdukModel.length,
  itemBuilder: (context, index) {
    final produk = daftarProdukModel[index];
    return CardProduk(
      produk: produk,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Memilih: \${produk.nama}')),
        );
      },
    );
  },
)''',
    halaman: const Tugas9(),
  ),
  PenjelasanItem(
    title: 'Custom Widget Studio',
    subtitle: 'Rancang widget & fungsi kustom secara interaktif',
    kategori: 'Studio',
    icon: Icons.tune_rounded,
    color: Colors.indigo,
    deskripsi: 'Studio interaktif untuk merancang custom widget dan fungsi dinamis. Pengguna dapat mengubah parameter geometri, warna, gradasi, bayangan, dan event interaksi secara langsung dengan live preview dan auto-generated Dart code.',
    poinPenting: [
      'Live Preview interaktif merespon setiap perubahan slider dan switch secara real-time',
      'Generator kode otomatis merangkai kode sintaks Flutter siap salin',
      'Pilihan tipe widget: Card, Button, TextField, Avatar, dan Alert Banner',
      'Pengujian event interaksi nyata: SnackBar, Dialog, Modal BottomSheet, dan State',
    ],
    cropKode: '''CustomWidgetPreview(
  config: config,
  onConfigChanged: (newConfig) {
    setState(() {
      config = newConfig;
    });
  },
)''',
    halaman: const HalamanCustomWidget(),
  ),
  PenjelasanItem(
    title: 'Latihan TextFormField & Login DB',
    subtitle: 'Validasi form, TextFormField, dan otentikasi DBHelper',
    kategori: 'Latihan',
    icon: Icons.login_rounded,
    color: Colors.blueAccent,
    deskripsi: 'TextFormField adalah widget input teks khusus yang terintegrasi langsung dengan Form dan GlobalKey<FormState>. Berbeda dengan TextField biasa, TextFormField menyediakan fungsi validasi otomatis (validator), pengelolaan nilai simpanan (onSaved), dan visual error text. Latihan ini memadukan Form validation dengan operasi otentikasi asynchronous menggunakan UserModelSQL dan simulasi DBHelper (SQLite) untuk alur registrasi dan login.',
    poinPenting: [
      'TextFormField membungkus TextField dengan integrasi FormField dan validator otomatis',
      'GlobalKey<FormState> mengontrol status validasi seluruh field input secara serentak via formKey.currentState!.validate()',
      'validator memeriksa kondisi kosong dan pola format email secara reaktif',
      'DBHelper mengelola operasi async basis data SQLite untuk registerUser dan loginUser',
      'showDialog dan AlertDialog memberikan feedback visual untuk pendaftaran, kesalahan login, serta dialog konfirmasi logout',
      'Navigator.push mengarahkan pengguna ke HomeScreen setelah otentikasi valid',
    ],
    cropKode: '''showDialog<void>(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext dialogContext) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      icon: const Icon(
        Icons.check_circle_rounded,
        size: 48,
        color: Colors.green,
      ),
      title: const Text('Pendaftaran Berhasil'),
      content: const Text(
        'Akun Anda berhasil disimpan ke SQLite. Silakan login.',
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Masuk Sekarang'),
          ),
        ),
      ],
    );
  },
)''',
    halaman: const LoginScreenDB(),
  ),
];

PenjelasanItem? cariPenjelasanItem(String title) {
  for (final item in daftarPenjelasan) {
    if (item.title.trim().toLowerCase() == title.trim().toLowerCase()) {
      return item;
    }
  }
  return null;
}
