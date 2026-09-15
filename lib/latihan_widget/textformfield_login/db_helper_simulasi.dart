import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/user_model_sql.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  final List<UserModelSQL> _databaseUsers = [];
  int _nextId = 1;

  DBHelper._internal() {
    _databaseUsers.add(
      UserModelSQL(
        id: _nextId++,
        email: 'admin@gmail.com',
        password: 'adminpassword',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    );
    _databaseUsers.add(
      UserModelSQL(
        id: _nextId++,
        email: 'hardi@flutter.dev',
        password: 'password123',
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<bool> registerUser(UserModelSQL user) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final emailExists = _databaseUsers.any(
      (u) => u.email.toLowerCase() == user.email.trim().toLowerCase(),
    );
    if (emailExists) {
      return false;
    }
    final newUser = user.copyWith(
      id: _nextId++,
      createdAt: DateTime.now(),
    );
    _databaseUsers.add(newUser);
    return true;
  }

  Future<UserModelSQL?> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      final user = _databaseUsers.firstWhere(
        (u) =>
            u.email.toLowerCase() == email.trim().toLowerCase() &&
            u.password == password,
      );
      return user;
    } catch (_) {
      return null;
    }
  }

  Future<List<UserModelSQL>> getAllUsers() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List.unmodifiable(_databaseUsers);
  }

  Future<bool> deleteUser(String email) async {
    final initialCount = _databaseUsers.length;
    _databaseUsers.removeWhere(
      (u) => u.email.toLowerCase() == email.trim().toLowerCase(),
    );
    return _databaseUsers.length < initialCount;
  }
}
