import 'package:flutter/material.dart';

class Tugas2Layout extends StatelessWidget {
  const Tugas2Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 196, 252),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DETAIL TOKO",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Milky Cream",
              ),
            ),
          ],
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
            const Row(
              children: [
                Icon(Icons.phone, color: Colors.black, size: 18),
                SizedBox(width: 15),
                Text('081311685803', style: TextStyle(fontSize: 15)),
                Spacer(),
                Icon(Icons.location_on, color: Colors.black, size: 18),
                Text('Jakarta, Indonesia', style: TextStyle(fontSize: 15)),
              ],
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
                      "https://minuman.com/cdn/shop/products/HIBIKI-HARMONY.jpg?v=1641890414",
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
