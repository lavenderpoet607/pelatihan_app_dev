import 'package:flutter/foundation.dart';

double kehadiran = 0.75;

int Ratarata = 70;

int uts = 70;
int uas = 70;

double persen = kehadiran * 100;

int remedial = 60;

double nilaiakhir = (uts + uas) / 2;

String status = (nilaiakhir >= 70 && uts >= remedial && uas >= remedial)
    ? "Lulus"
    : "Tidak Lulus";

void main() {
  if (kDebugMode) {
    print(
      "\n Persentase Kehadiran: $persen%\n Rata-rata Nilai: $Ratarata\n Nilai Akhir: $nilaiakhir\n Status: $status",
    );
  }
}
