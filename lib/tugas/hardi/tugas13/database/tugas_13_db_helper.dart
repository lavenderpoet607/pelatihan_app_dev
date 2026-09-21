import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas13/models/tugas_13_user_model.dart';

class Tugas13DBHelper {
  static final Tugas13DBHelper _instance = Tugas13DBHelper._internal();
  factory Tugas13DBHelper() => _instance;
  Tugas13DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tugas13_manajemen_data.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE,
            nomor_hp TEXT,
            password TEXT NOT NULL,
            kota TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertUser(Tugas13UserModel user) async {
    final db = await database;
    return await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tugas13UserModel>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      orderBy: 'id DESC',
    );
    return results.map((map) => Tugas13UserModel.fromMap(map)).toList();
  }

  Future<int> updateUser(Tugas13UserModel user) async {
    final db = await database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isEmailRegistered(String email, {int? excludeId}) async {
    final db = await database;
    String whereClause = 'email = ?';
    List<dynamic> whereArgs = [email];

    if (excludeId != null) {
      whereClause += ' AND id != ?';
      whereArgs.add(excludeId);
    }

    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: whereClause,
      whereArgs: whereArgs,
    );
    return results.isNotEmpty;
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
