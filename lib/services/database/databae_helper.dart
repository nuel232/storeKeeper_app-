import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:store_keeper_app/model/product.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('products.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        quantity REAL NOT NULL,
        price REAL NOT NULL,
        imagePath TEXT NOT NULL
      )
    ''');
  }

  // CREATE
  Future<int> createProduct(Product product) async {
    final db = await database;
    return await db.insert('products', product.toMap());
  }

  // READ ALL
  Future<List<Product>> readAllProducts() async {
    final db = await database;
    final result = await db.query('products');
    return result.map((json) => Product.fromMap(json)).toList();
  }

  // UPDATE
  Future<int> updateProduct(Product product) async {
    final db = await database;
    return await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  // DELETE
  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
