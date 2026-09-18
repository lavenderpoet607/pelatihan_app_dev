import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas12/models/tugas_12_user_model.dart';

class Tugas12DBHelper {
  static final Tugas12DBHelper _instance = Tugas12DBHelper._internal();
  factory Tugas12DBHelper() => _instance;
  Tugas12DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tugas12_pendaftaran.db');

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

  Future<int> insertUser(Tugas12UserModel user) async {
    final db = await database;
    return await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tugas12UserModel>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      orderBy: 'id DESC',
    );
    return results.map((map) => Tugas12UserModel.fromMap(map)).toList();
  }

  Future<bool> isEmailRegistered(String email) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return results.isNotEmpty;
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllUsers() async {
    final db = await database;
    return await db.delete('users');
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
