import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  _Tugas5State createState() => _Tugas5State();
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
                    print("Sentuhan terdeteksi");
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
                  print("Sentuhan terdeteksi");
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
                    _pesan = "Sentuhan terdeteksi : $_angka";
                  });
                  print("Sentuhan terdeteksi : $_angka");
                },
                onDoubleTap: () {
                  setState(() {
                    _angka += 2;
                    _pesan = "Sentuhan terdeteksi : $_angka";
                  });
                  print("Sentuhan terdeteksi : $_angka");
                },

                onLongPress: () {
                  setState(() {
                    _angka += 3;
                    _pesan = "Sentuhan terdeteksi : $_angka";
                  });
                  print("Sentuhan terdeteksi : $_angka");
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
                      "Angka : $_angka",
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
              "• Tap = +1 \n • Double Tap = +2 \n • Long Press = +3",
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
          _pesan = "Sentuhan terdeteksi : $_angka";
        },
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.remove),
      ),
    );
  }
}
