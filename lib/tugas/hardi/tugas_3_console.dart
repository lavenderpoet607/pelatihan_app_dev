import 'package:flutter/foundation.dart';

void main() {
  print("Tugas 1");

  print("Bilangan Ganjil dari 1 sampai 20:");
  for (int i = 1; i <= 20; i++) {
    if (i % 2 != 0) {
      print(i);
    }
  }

  print("");

  print("Tugas 2");

  for (int i = 1; i <= 5; i++) {
    print("*");
  }

  print("");
  print("pada bintang bisa ada diatas dan dibawahnya");
  print("");

  for (int i = 1; i <= 5; i++) {
    String bintang = "";
    for (int j = 1; j <= i; j++) {
      bintang += "*";
    }
    print(bintang);
  }

  print("");
  print("atau bintang ini");
  for (int i = 1; i <= 5; i++) {
    print("*" * 5);
  }

  print("");
  print("Tugas 3");

  for (int i = 1; i <= 4; i++) {
    print("Ridho");
  }

  print("");
  print("Tugas 4");

  int indexBuah = 1;
  List<String> buah = ["Apel", "Jeruk", "Mangga", "Anggur"];
  for (var entry in buah.asMap().entries) {
    int _ = entry.key;
    String _ = entry.value;
    if (indexBuah > 1) {
      break;
    }
    print(
      "Saya Suka Buah ${buah[indexBuah + 2]} & ${buah[indexBuah - 1]} dari ${buah.length} buah yaitu ${buah.join(", ")}",
    );
  }

  if (kDebugMode) {
    print("");
    print("Tugas 5");
  }

  int index = 1;
  List<String> daftarBelanja = ["Beras", "Daging", "Sayur", "Buah"];
  if (kDebugMode) {
    print("Daftar Belanja:");
  }
  for (String item in daftarBelanja) {
    if (kDebugMode) {
      print("Item ke-$index: $item");
    }
    index++;
  }
}
