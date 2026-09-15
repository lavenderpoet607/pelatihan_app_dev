class UserModelSQL {
  final int? id;
  final String email;
  final String password;
  final DateTime? createdAt;

  UserModelSQL({
    this.id,
    required this.email,
    required this.password,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'created_at': (createdAt ?? DateTime.now()).toIso8601String(),
    };
  }

  factory UserModelSQL.fromMap(Map<String, dynamic> map) {
    return UserModelSQL(
      id: map['id'] as int?,
      email: map['email'] as String? ?? '',
      password: map['password'] as String? ?? '',
      createdAt: map['created_at'] != null
          ? DateTime.tryParse(map['created_at'] as String)
          : null,
    );
  }

  UserModelSQL copyWith({
    int? id,
    String? email,
    String? password,
    DateTime? createdAt,
  }) {
    return UserModelSQL(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
