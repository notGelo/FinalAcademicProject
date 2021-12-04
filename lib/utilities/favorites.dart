import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Favorites {
  final int? id;
  final String url;
  final String label;
  final String image;
  final String source;

  Favorites({
    this.id,
    required this.url,
    required this.label,
    required this.image,
    required this.source,
  });

  factory Favorites.fromMap(Map<String, dynamic> json) => new Favorites(
        id: json['id'],
        url: json['url'],
        label: json['label'],
        image: json['image'],
        source: json['source'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'label': label,
      'image': image,
      'source': source,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'favorites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites(
          id INTEGER PRIMARY KEY,
          url TEXT,
          label TEXT,
          image TEXT,
          source TEXT
      )
      ''');
  }

  Future<List<Favorites>> getFavorites() async {
    Database db = await instance.database;
    var favorite = await db.query('favorites', orderBy: 'label');
    List<Favorites> favoritesList = favorite.isNotEmpty
        ? favorite.map((c) => Favorites.fromMap(c)).toList()
        : [];
    return favoritesList;
  }

  Future<int> add(Favorites favorites) async {
    Database db = await instance.database;
    return await db.insert('favorites', favorites.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  // ignore: non_constant_identifier_names
  Future<int> remove_heart(String label) async {
    Database db = await instance.database;
    return await db.delete('favorites', where: 'label = ?', whereArgs: [label]);
  }

  Future<bool> isFavorite(String label, String source) async {
    final db = await instance.database;

    final maps = await db.rawQuery(
        'SELECT * FROM favorites WHERE label = ? and source = ?',
        [label, source]);

    return maps.isNotEmpty;
  }
}
