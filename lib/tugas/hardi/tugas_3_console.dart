import 'package:flutter/foundation.dart';

void main() {
  debugPrint("Tugas 1");

  debugPrint("Bilangan Ganjil dari 1 sampai 20:");
  for (int i = 1; i <= 20; i++) {
    if (i % 2 != 0) {
      debugPrint(i.toString());
    }
  }

  debugPrint("");

  debugPrint("Tugas 2");

  for (int i = 1; i <= 5; i++) {
    debugPrint("*");
  }

  debugPrint("");
  debugPrint("pada bintang bisa ada diatas dan dibawahnya");
  debugPrint("");

  for (int i = 1; i <= 5; i++) {
    String bintang = "";
    for (int j = 1; j <= i; j++) {
      bintang += "*";
    }
    debugPrint(bintang);
  }

  debugPrint("");
  debugPrint("atau bintang ini");
  for (int i = 1; i <= 5; i++) {
    debugPrint("*" * 5);
  }

  debugPrint("");
  debugPrint("Tugas 3");

  for (int i = 1; i <= 4; i++) {
    debugPrint("Ridho");
  }

  debugPrint("");
  debugPrint("Tugas 4");

  int indexBuah = 1;
  List<String> buah = ["Apel", "Jeruk", "Mangga", "Anggur"];
  for (var entry in buah.asMap().entries) {
    int _ = entry.key;
    String _ = entry.value;
    if (indexBuah > 1) {
      break;
    }
    debugPrint(
      "Saya Suka Buah ${buah[indexBuah + 2]} & ${buah[indexBuah - 1]} dari ${buah.length} buah yaitu ${buah.join(", ")}",
    );
  }

  debugPrint("");
  debugPrint("Tugas 5");

  int index = 1;
  List<String> daftarBelanja = ["Beras", "Daging", "Sayur", "Buah"];
  {
    debugPrint("Daftar Belanja:");
    for (String item in daftarBelanja) {
      debugPrint("Item ke-$index: $item");
      index++;
    }
  }
}
