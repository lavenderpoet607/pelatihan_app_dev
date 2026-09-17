import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/core/user_model_sql.dart';

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

    final isExist = _databaseUsers.any(
      (u) => u.email.toLowerCase() == user.email.toLowerCase(),
    );

    if (isExist) {
      return false;
    }

    final newUser = UserModelSQL(
      id: _nextId++,
      email: user.email,
      password: user.password,
      createdAt: DateTime.now(),
    );
    _databaseUsers.add(newUser);
    return true;
  }

  Future<UserModelSQL?> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      final user = _databaseUsers.firstWhere(
        (user) =>
            user.email.toLowerCase() == email.toLowerCase() &&
            user.password == password,
      );
      return user;
    } catch (_) {
      return null;
    }
  }

  Future<List<UserModelSQL>> getAllUsers() async {
    await Future.delayed(const Duration(milliseconds: 150));
    return List.unmodifiable(_databaseUsers);
  }
}
