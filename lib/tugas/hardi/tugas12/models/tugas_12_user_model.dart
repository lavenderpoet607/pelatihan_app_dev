class Tugas12UserModel {
  final int? id;
  final String nama;
  final String email;
  final String nomorHp;
  final String password;
  final String kota;

  const Tugas12UserModel({
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

  factory Tugas12UserModel.fromMap(Map<String, dynamic> map) {
    return Tugas12UserModel(
      id: map['id'] as int?,
      nama: map['nama'] as String? ?? '',
      email: map['email'] as String? ?? '',
      nomorHp: map['nomor_hp'] as String? ?? '',
      password: map['password'] as String? ?? '',
      kota: map['kota'] as String? ?? '',
    );
  }
}
