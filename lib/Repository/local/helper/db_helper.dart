import 'package:sqflite/sqflite.dart';

import '../../../Model/brand.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblBookmark = 'bookmarks';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/favorit.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookmark (
            id INTEGER PRIMARY KEY,
            brand TEXT,
            model TEXT,
            varian TEXT,
            harga INTEGER,
            jumlah_kursi INTEGER,
            CC INTEGER,
            Daya_dorong INTEGER,
            imageUrl TEXT 
          )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<void> insertBookmark(Brand restaurant) async {
    print(restaurant);

    final db = await database;
    await db!.insert(_tblBookmark, restaurant.toJson());

    print(db);
  }

  Future<List<Brand>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblBookmark);

    return results.map((res) => Brand.fromJson(res)).toList();
  }

  Future<Map> getFavoritekById(int id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblBookmark,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(int id) async {
    final db = await database;

    await db!.delete(
      _tblBookmark,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
