class TugasCodeRepository {
  static String getFileName({
    required String nomor,
    required String pembuat,
    String namaSiswa = 'Ridho_Tawang',
  }) {
    final cleanNomor = nomor.trim();
    final cleanPembuat = pembuat.trim();
    return '${namaSiswa}_tugas_${cleanNomor}_$cleanPembuat.png';
  }

  static String getSourceCode(String nomor, String pembuat) {
    final key = '${nomor.trim()}_${pembuat.trim()}';
    if (kodeTugas.containsKey(key)) {
      return kodeTugas[key]!;
    }
    for (final entry in kodeTugas.entries) {
      if (entry.key.startsWith(nomor.trim())) {
        return entry.value;
      }
    }
    return 'Kode sumber tidak ditemukan.';
  }

  static const Map<String, String> kodeTugas = {
    '01_Hardi': '''import 'package:flutter/material.dart';

class Tugas1Widget extends StatefulWidget {
  const Tugas1Widget({super.key});

  @override
  State<Tugas1Widget> createState() {
    return _Tugas1WidgetState();
  }
}

class _Tugas1WidgetState extends State<Tugas1Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 253, 135),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.view_headline, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https:
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nama: Ridho Dibaja Tawang',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Alamat: Jl. Kebon Sayur 1 BidacaraCina',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Deskripsi: Bermain Game, Membaca Buku, dan Menulis',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
''',
    '02_Hardi': '''import 'package:flutter/material.dart';

class Tugas2Layout extends StatelessWidget {
  const Tugas2Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 196, 252),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text(
          "DETAIL TOKO",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Harumony Mystic Emporium",
                    style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Cursive",
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.pink[400],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.email, color: Colors.black, size: 18),
                        SizedBox(width: 15),
                        Text(
                          "harumony.id",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 15,
                runSpacing: 8,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone, color: Colors.black, size: 18),
                      SizedBox(width: 15),
                      Text('081311685803', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on, color: Colors.black, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Jakarta, Indonesia',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 141, 179),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "300++",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "book sold per month",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 141, 179),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4.8 / 5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "rate by user",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                "Harumony Mystic Emporium adalah toko buku bernuansa magis yang menghadirkan koleksi novel fantasi, buku misteri, mitologi, spiritualitas, hingga literatur klasik dalam suasana hangat dan estetik. Dengan sentuhan tema celestial dan enchanted, toko ini dirancang sebagai tempat nyaman bagi para pecinta buku untuk menjelajahi dunia imajinasi, pengetahuan, dan kisah penuh keajaiban. Selain buku, Harumony Mystic Emporium juga menawarkan berbagai aksesori dan dekorasi bertema mystic yang menambah pengalaman membaca terasa lebih unik dan memikat.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14, fontFamily: "Milky Cream"),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 141, 179),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      "https:
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
''',
    '03_Ferry': '''import 'package:flutter/material.dart';

class Tugas3Lumi extends StatelessWidget {
  const Tugas3Lumi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.view_headline,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                'https:
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Masa Depan Energi Terbarukan: Inovasi EcoSync di Tahun 2024',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 1.3,
                fontStyle: FontStyle.italic,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https:
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Teknologi rumah pintar terus berkembang pesat, membawa efisiensi energi ke tingkat yang belum pernah terbayangkan sebelumnya. Inovasi terbaru dari EcoSync menghadirkan solusi cerdas untuk mengelola konsumsi energi rumah tangga secara otomatis dan real-time.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Apa Itu EcoSync?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'EcoSync adalah platform manajemen energi berbasis AI yang memungkinkan pengguna memantau dan mengoptimalkan penggunaan listrik di rumah. Dengan sensor pintar dan algoritma prediktif, sistem ini dapat menyesuaikan konsumsi energi sesuai dengan kebutuhan dan kebiasaan pengguna.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildBulletPoint('Penghematan energi hingga 40%'),
                  const SizedBox(height: 8),
                  _buildBulletPoint('Integrasi dengan perangkat IoT'),
                  const SizedBox(height: 8),
                  _buildBulletPoint('Dashboard real-time via aplikasi'),
                  const SizedBox(height: 8),
                  _buildBulletPoint('Ramah lingkungan dan berkelanjutan'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(198, 255, 92, 1),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Baca Selengkapnya',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(198, 255, 92, 1),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
''',
    '03_Hardi': '''import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 64, 64),
        title: const Text(
          "Registrasi & Katalog",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 22, fontFamily: "Milky Cream"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Register Form",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter YourName',
              ),
            ),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.contact_phone),
                border: OutlineInputBorder(),
                labelText: 'Contact',
                hintText: 'Enter Your Contact',
              ),
            ),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                border: OutlineInputBorder(),
                labelText: 'Number Phone',
                hintText: 'Enter Your Number',
              ),
            ),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Password',
              ),
            ),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                labelText: 'Confirm Pasword',
                hintText: 'Confirm Your Pasword',
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Wilayah pemantauan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https:
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha(180),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Wilayah 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https:
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha(180),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Wilayah 2",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https:
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha(180),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Wilayah 3",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https:
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha(180),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Wilayah 4",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https:
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha(180),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Wilayah 5",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https:
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha(180),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Wilayah 6",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
''',
    '04_Hardi': '''import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 64, 64),
        title: const Text(
          "ListView & ListTile",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
          ),
        ),
      ),
      body: ListView(
        children: [
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
          SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.contact_phone),
              border: OutlineInputBorder(),
              labelText: 'Contact',
              hintText: 'Enter Your Contact',
            ),
          ),
          SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone_android),
              border: OutlineInputBorder(),
              labelText: 'Number Phone',
              hintText: 'Enter Your Number',
            ),
          ),
          SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.location_city_outlined),
              border: OutlineInputBorder(),
              labelText: 'Address',
              hintText: 'Enter Address',
            ),
          ),
          SizedBox(height: 30),
          Text("--- Bagian Daftar (List) ---"),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Andi Rahmat'),
              subtitle: const Text('Aktif'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Budi Santoso'),
              subtitle: const Text('Non-Aktif'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Citra Natalia'),
              subtitle: const Text('Aktif'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Dede'),
              subtitle: const Text('Non-Aktif'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: const Icon(Icons.person, color: Colors.teal),
              ),
              title: const Text('Ridho'),
              subtitle: const Text('Aktif'),
            ),
          ),
        ],
      ),
    );
  }
}
''',
    '05_Ferry': '''import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

bool _showText = false;
bool _isFavorite = false;
bool _textButton = false;
bool _textInk = false;
int _angka = 10;
String _pesan = "";

class _Tugas5State extends State<Tugas5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Interaksi Flutter",
          style: TextStyle(fontSize: 20, fontFamily: "Milky Cream"),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Ini tentang Elevated Button"),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showText = !_showText;
                  });
                },
                child: Text("Klik Saya!"),
              ),
            ),
            SizedBox(height: 30),
            Text("Ini tentang Icon Button"),
            Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: _isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ),
            if (_isFavorite) Text("Disukai"),
            if (!_isFavorite) Text("Belum Disukai (yahahah di Ghosting)"),
            SizedBox(height: 30),
            Text("Ini tentang Text Button"),
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _textButton = !_textButton;
                  });
                  if (_textButton) {
                    debugPrint("Sentuhan terdeteksi");
                  }
                },
                child: Text(
                  "Lihat Deskripsi",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Milky Cream",
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Ini tentang Ink Well"),
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _textInk = !_textInk;
                  });
                  debugPrint("Sentuhan terdeteksi");
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Sentuh kotak ini",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Milky Cream",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (_textInk)
              Text(
                "Sentuhan terdeteksi",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Milky Cream",
                ),
              ),
            SizedBox(height: 10),
            Text("Ini Tentang GestureDetector"),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _angka++;
                    _pesan = "Sentuhan terdeteksi : \$_angka";
                  });
                  debugPrint("Sentuhan terdeteksi : \$_angka");
                },
                onDoubleTap: () {
                  setState(() {
                    _angka += 2;
                    _pesan = "Sentuhan terdeteksi : \$_angka";
                  });
                  debugPrint("Sentuhan terdeteksi : \$_angka");
                },

                onLongPress: () {
                  setState(() {
                    _angka += 3;
                    _pesan = "Sentuhan terdeteksi : \$_angka";
                  });
                  debugPrint("Sentuhan terdeteksi : \$_angka");
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      "Angka : \$_angka",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (_pesan.isNotEmpty)
              Text(
                _pesan,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 10),
            Text(
              "• Tap = +1 \\n • Double Tap = +2 \\n • Long Press = +3",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _angka--;
          });
          _pesan = "Sentuhan terdeteksi : \$_angka";
        },
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.remove),
      ),
    );
  }
}
''',
    '07_Hardi': '''import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/components/tugas_7_drawer.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 72, 160),
        foregroundColor: Colors.white,
        title: const Text(
          "Syarat & Ketentuan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
          ),
        ),
      ),
      drawer: Tugas7Drawer(
        onThemeChanged: widget.onThemeChanged,
        isDarkMode: widget.isDarkMode,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Syarat & Ketentuan",
              style: TextStyle(
                fontFamily: "Milky Cream",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              title: const Text(
                "Saya menyetujui semua persyaratan yang berlaku",
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 16),
            Text(
              _isChecked
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: _isChecked ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
''',
    '08_Ferry': '''import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/components/tugas_8_drawer.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/core/tugas_8_tab_enum.dart';

class Tugas8 extends StatefulWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const Tugas8({super.key, this.onThemeChanged, this.isDarkMode = false});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  Tugas8Tab _currentTab = Tugas8Tab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          _currentTab.appBarTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Milky Cream",
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
        elevation: 1,
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
        selectedItemColor: const Color(0xFF0284C7),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentTab = Tugas8Tab.values[index];
          });
        },
        items: Tugas8Tab.values.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab.icon),
            activeIcon: Icon(tab.activeIcon),
            label: tab.label,
          );
        }).toList(),
      ),
    );
  }
}
''',
    '09_Ferry': '''import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/core/tugas_9_tab_enum.dart';

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
''',
    '10_Hardi': '''import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/components/tugas_10_dialog.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/core/tugas_10_enum.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/components/tugas_10_halaman_konfirmasi.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/core/tugas_10_model_peserta.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/extensions/tugas_10_validator.dart';

class Tugas10 extends StatefulWidget {
  const Tugas10({super.key});

  @override
  State<Tugas10> createState() => _Tugas10State();
}

class _Tugas10State extends State<Tugas10> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  Tugas10Peminatan _selectedPeminatan = Tugas10Peminatan.flutterMobile;

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _nomorHpController.dispose();
    _kotaController.dispose();
    super.dispose();
  }

  void _isiDataOtomatis() {
    setState(() {
      _namaController.text = 'Hardi Pratama';
      _emailController.text = 'hardi.pratama@gmail.com';
      _nomorHpController.text = '081234567890';
      _kotaController.text = 'Jakarta';
      _selectedPeminatan = Tugas10Peminatan.flutterMobile;
    });
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _namaController.clear();
      _emailController.clear();
      _nomorHpController.clear();
      _kotaController.clear();
      _selectedPeminatan = Tugas10Peminatan.flutterMobile;
    });
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan lengkapi formulir dengan data yang valid.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final peserta = PesertaPendaftaranModel(
      namaLengkap: _namaController.text.trim(),
      email: _emailController.text.trim(),
      nomorHp: _nomorHpController.text.trim(),
      kotaAsal: _kotaController.text.trim(),
      peminatan: _selectedPeminatan,
      waktuDaftar: DateTime.now(),
    );

    Tugas10DialogHelper.showRingkasanDialog(
      context: context,
      peserta: peserta,
      onLanjut: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                HalamanKonfirmasiPendaftaran(peserta: peserta),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 10 - Form Pendaftaran'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Isi Data Uji Coba',
            icon: const Icon(Icons.auto_fix_high_rounded),
            onPressed: _isiDataOtomatis,
          ),
          IconButton(
            tooltip: 'Reset Formulir',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _resetForm,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.assignment_ind_rounded,
                            color: Colors.blue.shade700,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Formulir Pendaftaran Aplikasi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Isi data calon peserta di bawah ini. Setelah menekan tombol Daftar, ringkasan data akan diverifikasi melalui dialog sebelum diarahkan ke halaman konfirmasi.',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.blueGrey.shade800,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.namaLengkap.label,
                    hintText: Tugas10FormField.namaLengkap.hint,
                    prefixIcon: Icon(Tugas10FormField.namaLengkap.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: Tugas10Validator.validateNama,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.email.label,
                    hintText: Tugas10FormField.email.hint,
                    prefixIcon: Icon(Tugas10FormField.email.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Tugas10Validator.validateEmail,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nomorHpController,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.nomorHp.label,
                    hintText: Tugas10FormField.nomorHp.hint,
                    prefixIcon: Icon(Tugas10FormField.nomorHp.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: Tugas10Validator.validateNomorHp,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _kotaController,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.kotaAsal.label,
                    hintText: Tugas10FormField.kotaAsal.hint,
                    prefixIcon: Icon(Tugas10FormField.kotaAsal.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  textInputAction: TextInputAction.done,
                  validator: Tugas10Validator.validateKota,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<Tugas10Peminatan>(
                  initialValue: _selectedPeminatan,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.peminatan.label,
                    hintText: Tugas10FormField.peminatan.hint,
                    prefixIcon: Icon(Tugas10FormField.peminatan.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  items: Tugas10Peminatan.values.map((peminatan) {
                    return DropdownMenuItem<Tugas10Peminatan>(
                      value: peminatan,
                      child: Row(
                        children: [
                          Icon(
                            peminatan.icon,
                            size: 20,
                            color: peminatan.color,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            peminatan.label,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedPeminatan = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 28),
                ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text(
                    'Daftar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
''',
    '11_Habibi': '''import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_splash_screen.dart';

export 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/auto_login_card.dart';
export 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/login_form_card.dart';
export 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/login_header.dart';
export 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/session_banner.dart';
export 'package:pelatihan_app_dev/tugas/habibi/tugas11/components/session_info_card.dart';
export 'package:pelatihan_app_dev/tugas/habibi/tugas11/extensions/navigator_extension.dart';
export 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_home_screen.dart';
export 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_login_screen.dart';
export 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_splash_screen.dart';

class Tugas11 extends StatelessWidget {
  const Tugas11({super.key});

  @override
  Widget build(BuildContext context) {
    return const Tugas11SplashScreen();
  }
}
''',
    '12_Hardi': '''import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas12/database/tugas_12_db_helper.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas12/models/tugas_12_user_model.dart';

class Tugas12 extends StatefulWidget {
  const Tugas12({super.key});

  @override
  State<Tugas12> createState() => _Tugas12State();
}

class _Tugas12State extends State<Tugas12> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  final Tugas12DBHelper _dbHelper = Tugas12DBHelper();
  late Future<List<Tugas12UserModel>> _usersFuture;
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _refreshUsers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _namaController.dispose();
    _emailController.dispose();
    _nomorHpController.dispose();
    _passwordController.dispose();
    _kotaController.dispose();
    super.dispose();
  }

  void _refreshUsers() {
    setState(() {
      _usersFuture = _dbHelper.getAllUsers();
    });
  }

  void _isiDataOtomatis() {
    setState(() {
      _namaController.text = 'Hardi Pratama';
      _emailController.text = 'hardi.pratama@gmail.com';
      _nomorHpController.text = '081234567890';
      _passwordController.text = 'Password123';
      _kotaController.text = 'Jakarta Utara';
    });
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _namaController.clear();
      _emailController.clear();
      _nomorHpController.clear();
      _passwordController.clear();
      _kotaController.clear();
    });
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan lengkapi data dengan benar'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final newUser = Tugas12UserModel(
      nama: _namaController.text.trim(),
      email: _emailController.text.trim(),
      nomorHp: _nomorHpController.text.trim(),
      password: _passwordController.text,
      kota: _kotaController.text.trim(),
    );

    try {
      await _dbHelper.insertUser(newUser);

      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      _refreshUsers();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.teal),
              SizedBox(width: 8),
              Text('Data Berhasil Disimpan'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama: \${newUser.nama}'),
              const SizedBox(height: 4),
              Text('Email: \${newUser.email}'),
              const SizedBox(height: 4),
              Text(
                'Nomor HP: \${newUser.nomorHp.isEmpty ? '-' : newUser.nomorHp}',
              ),
              const SizedBox(height: 4),
              Text('Asal Kota: \${newUser.kota}'),
              const SizedBox(height: 8),
              const Text(
                'Data telah tersimpan permanen ke dalam database SQLite.',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _resetForm();
                _tabController.animateTo(1);
              },
              child: const Text('Lihat Data Peserta'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan: \$e'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  Future<void> _deleteUser(Tugas12UserModel user) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: Text('Yakin ingin menghapus peserta \${user.nama}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true && user.id != null) {
      await _dbHelper.deleteUser(user.id!);
      _refreshUsers();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data \${user.nama} berhasil dihapus'),
          backgroundColor: Colors.blueGrey,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas 12 - Database SQFLite',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal.shade800,
        elevation: 0.5,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.teal,
          indicatorWeight: 3,
          tabs: const [
            Tab(
              icon: Icon(Icons.app_registration_rounded),
              text: 'Form Pendaftaran',
            ),
            Tab(icon: Icon(Icons.people_alt_rounded), text: 'Data Peserta'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh Data',
            onPressed: _refreshUsers,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildFormTab(), _buildListTab()],
      ),
    );
  }

  Widget _buildFormTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 0,
              color: Colors.teal.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.teal.shade100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.storage_rounded,
                      color: Colors.teal.shade700,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pendaftaran Database Lokal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Data disimpan permanen di SQLite (ppkd_tugas12.db)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.teal.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap *',
                hintText: 'Masukkan nama lengkap',
                prefixIcon: const Icon(Icons.person_outline_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama lengkap wajib diisi';
                }
                if (value.trim().length < 3) {
                  return 'Nama minimal 3 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email *',
                hintText: 'contoh@domain.com',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email wajib diisi';
                }
                if (!value.contains('@') || !value.contains('.')) {
                  return 'Format email tidak valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _nomorHpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Nomor HP',
                hintText: '08xxxxxxxxxx (opsional)',
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value != null && value.trim().isNotEmpty) {
                  if (value.trim().length < 10) {
                    return 'Nomor HP minimal 10 digit';
                  }
                  if (!RegExp(r'^[0-9]+\$').hasMatch(value.trim())) {
                    return 'Nomor HP hanya boleh angka';
                  }
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Minimal 6 karakter',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password wajib diisi';
                }
                if (value.length < 6) {
                  return 'Password minimal 6 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _kotaController,
              decoration: InputDecoration(
                labelText: 'Asal Kota *',
                hintText: 'Masukkan asal kota',
                prefixIcon: const Icon(Icons.location_city_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Asal kota wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Daftar & Simpan ke Database',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isiDataOtomatis,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.teal,
                      side: const BorderSide(color: Colors.teal),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Isi Otomatis'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _resetForm,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey.shade700,
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTab() {
    return FutureBuilder<List<Tugas12UserModel>>(
      future: _usersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.teal));
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text('Terjadi kesalahan: \${snapshot.error}'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _refreshUsers,
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          );
        }

        final users = snapshot.data ?? [];

        if (users.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline_rounded,
                  size: 72,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 16),
                Text(
                  'Belum ada peserta terdaftar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Silakan isi formulir pendaftaran di tab sebelah',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => _tabController.animateTo(0),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Buka Form Pendaftaran'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => _refreshUsers(),
          color: Colors.teal,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final initial = user.nama.isNotEmpty
                  ? user.nama[0].toUpperCase()
                  : '?';

              return Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.teal.shade100,
                        child: Text(
                          initial,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    user.nama,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.teal.shade50,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Colors.teal.shade200,
                                    ),
                                  ),
                                  child: Text(
                                    user.kota,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.teal.shade800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.email_outlined,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    user.email,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (user.nomorHp.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone_outlined,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    user.nomorHp,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.redAccent,
                          size: 20,
                        ),
                        tooltip: 'Hapus Peserta',
                        onPressed: () => _deleteUser(user),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
''',
  };
}
