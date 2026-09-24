# Panduan Tugas 14 Flutter: Integrasi Public API & Parsing JSON (Pokemon API)

Dokumen ini menjelaskan implementasi lengkap Tugas 14 menggunakan Public API Pokemon (PokeAPI v2) dengan library Dio, Model Class, FutureBuilder, dan penanganan status asinkron.

---

## 1. Arsitektur File & Struktur Folder

```
lib/
├── latihan_widget/
│   └── dio_public_api/
│       └── latihan_dio_public_api.dart
└── tugas/
    └── hardi/
        └── tugas14/
            ├── models/
            │   └── pokemon_model.dart
            ├── services/
            │   └── pokemon_api_service.dart
            ├── halaman_detail_pokemon.dart
            └── tugas_14_pokemon_api.dart
```

---

## 2. Rincian Komponen

### A. Model Class (pokemon_model.dart)
1. **PokemonItemModel**:
   - Memetakan field `name` dan `url` dari endpoint daftar Pokemon.
   - Mengekstrak ID Pokemon dari URL secara dinamis.
   - Membentuk URL Official Artwork resolusi tinggi dari GitHub PokeAPI sprites.
2. **PokemonDetailModel**:
   - Memetakan data lengkap dari endpoint spesifik Pokemon.
   - Mengambil tipe elemen, tinggi (dikonversi ke meter), berat (dikonversi ke kg), base experience, daftar kemampuan (abilities), dan nilai base stats.

### B. Networking Service (pokemon_api_service.dart)
- Menggunakan `Dio` dengan konfigurasi Base URL `https://pokeapi.co/api/v2`.
- Mengatur `connectTimeout` dan `receiveTimeout` sebesar 15 detik.
- Menangani `DioException` (connection timeout, connection error, atau status error server) dengan pesan ramah pengguna.
- Fungsi:
  - `fetchPokemonList({int limit = 50, int offset = 0})`: Mengambil daftar Pokemon.
  - `fetchPokemonDetail(String nameOrId)`: Mengambil data detail satu Pokemon.

### C. Halaman Utama (tugas_14_pokemon_api.dart)
- Menggunakan `FutureBuilder<List<PokemonItemModel>>` untuk menangani 3 fase asinkron:
  1. **Loading**: Menampilkan indikator loading elegan dengan teks informatif.
  2. **Error**: Menampilkan ilustrasi jaringan mati, detail error, dan tombol 'Coba Lagi'.
  3. **Success**: Menampilkan daftar kartu Pokemon menggunakan `ListView.builder`.
- **Pull to Refresh**: Menggunakan widget `RefreshIndicator` untuk memuat ulang data terbaru dari API.
- **Search Bar Interaktif**: Pencarian real-time berdasarkan nama maupun nomor ID Pokemon.
- **Tombol Penjelasan**: Ikon buku pada AppBar untuk langsung membuka halaman materi penjelasan.

### D. Halaman Detail (halaman_detail_pokemon.dart)
- Menampilkan gambar Official Artwork dalam ukuran besar dengan loading placeholder dan error builder.
- Menampilkan badge tipe elemen dengan warna khas (Grass: hijau, Fire: oranye, Water: biru, Electric: kuning, dll).
- Kartu informasi fisik: Tinggi (m), Berat (kg), dan Base Experience.
- Daftar chip kemampuan (Abilities).
- Visual progress bar untuk seluruh Base Statistics (HP, Attack, Defense, Speed, dll).

### E. File Latihan (latihan_dio_public_api.dart)
- File latihan mandiri di `lib/latihan_widget/dio_public_api/latihan_dio_public_api.dart`.
- Mencontohkan alur dasar pengambilan data HTTP GET sederhana dengan Dio dan FutureBuilder.

---

## 3. Integrasi Routing & Menu

1. **Rute**:
   - `AppRoutes.tugas14` (`/tugas14`)
   - `AppRoutes.latihanPublicApiDio` (`/latihan_public_api_dio`)
2. **Menu Utama**:
   - Tab Latihan: `Latihan Public API (Dio)`
   - Tab Tugas Mandiri: `Tugas 14: Integrasi Public API`
   - Buku Katalog Penjelasan: `Tugas 14: Integrasi Public API & Parsing JSON`

