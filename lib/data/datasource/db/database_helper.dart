import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/utils/encrypt.dart';
import 'package:klikdaily/utils/type_fruits.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblFruit = 'fruit';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/podware.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
      password: encrypt("terserahpasswodnya"),
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblFruit (
        id INTEGER PRIMARY KEY,
        name TEXT,
        price INTEGER,
        totalItems INTEGER,
        typeFruit TEXT,
        assets TEXT
      );
    ''');
  }

  Future<int> addCart(Fruit fruit) async {
    final db = await database;

    final result = await db!.rawInsert(
      "INSERT INTO $_tblFruit(id, name, price, totalItems, typeFruit, assets) VALUES (?,?,?,?,?,?)",
      [
        fruit.id,
        fruit.name,
        fruit.price,
        fruit.totalItems,
        typeToStringFruit(fruit.typeFruit),
        fruit.assets,
      ],
    );

    return result;
  }

  // Future<int> removeWatchlistTv(TvModel tv) async {
  //   final db = await database;
  //   return await db!.delete(
  //     _tblTvWatchlist,
  //     where: 'id = ?',
  //     whereArgs: [tv.id],
  //   );
  // }

  Future<Map<String, dynamic>?> getFruitByType(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblFruit,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<int> updateTotalItemsFruit(Fruit fruit) async {
    final db = await database;

    final result = await db!.rawUpdate(
      "UPDATE $_tblFruit SET totalItems = ? WHERE id = ?",
      [
        fruit.totalItems,
        fruit.id,
      ],
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> getCarts() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblFruit);
    return results;
  }

  // Future<int> updateAudioDownload(AudioClip audioClip) async {
  //   final db = await database;

  //   final result = await db!.rawUpdate(
  //     "UPDATE $_tblFruit SET image = ?, url = ? WHERE id = ?",
  //     [
  //       audioClip.channel.urls.logoImage.original,
  //       audioClip.urls.highMp3,
  //       audioClip.id,
  //     ],
  //   );

  //   return result;
  // }

}
