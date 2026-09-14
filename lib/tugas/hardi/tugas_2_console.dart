// Menyimpan persentase kehadiran dalam bentuk desimal
import 'package:flutter/foundation.dart';

double kehadiran = 0.75;

// Menyimpan nilai rata-rata
int Ratarata = 70;

// Menyimpan nilai UTS dan UAS
int uts = 70;
int uas = 70;

// Mengubah nilai kehadiran dari desimal menjadi persentase
double persen = kehadiran * 100;

// Menentukan nilai minimal untuk remedial
int remedial = 60;

// Menghitung nilai akhir dari rata-rata nilai UTS dan UAS
double nilaiakhir = (uts + uas) / 2;

// Menentukan status kelulusan berdasarkan nilai akhir, UTS, dan UAS
String status = (nilaiakhir >= 70 && uts >= remedial && uas >= remedial) ? "Lulus" : "Tidak Lulus";

// Fungsi utama yang akan dijalankan pertama kali
void main() {
  if (kDebugMode) {
    print("\n Persentase Kehadiran: $persen%\n Rata-rata Nilai: $Ratarata\n Nilai Akhir: $nilaiakhir\n Status: $status");
  }
}