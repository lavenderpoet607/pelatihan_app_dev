class Tugas13UserModel {
  final int? id;
  final String nama;
  final String email;
  final String nomorHp;
  final String password;
  final String kota;

  const Tugas13UserModel({
    this.id,
    required this.nama,
    required this.email,
    required this.nomorHp,
    required this.password,
    required this.kota,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'nama': nama,
      'email': email,
      'nomor_hp': nomorHp,
      'password': password,
      'kota': kota,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Tugas13UserModel.fromMap(Map<String, dynamic> map) {
    return Tugas13UserModel(
      id: map['id'] as int?,
      nama: map['nama'] as String? ?? '',
      email: map['email'] as String? ?? '',
      nomorHp: map['nomor_hp'] as String? ?? '',
      password: map['password'] as String? ?? '',
      kota: map['kota'] as String? ?? '',
    );
  }

  Tugas13UserModel copyWith({
    int? id,
    String? nama,
    String? email,
    String? nomorHp,
    String? password,
    String? kota,
  }) {
    return Tugas13UserModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      nomorHp: nomorHp ?? this.nomorHp,
      password: password ?? this.password,
      kota: kota ?? this.kota,
    );
  }
}
