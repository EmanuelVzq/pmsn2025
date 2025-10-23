import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FoodDatabase {
  static final nameDB = "FOODDB";
  static final versionDB = 2;
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    return _database = await _initDatabase();
  }

  Future<Database?> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return openDatabase(
      pathDB,
      version: versionDB,
      onCreate: createTables,
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute("DROP TABLE IF EXISTS detalle_compra");
        await db.execute("DROP TABLE IF EXISTS compra");
        await createTables(db, newVersion);
      },
    );
  }

  FutureOr<void> createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE compra(
        id_compra INTEGER PRIMARY KEY AUTOINCREMENT,
        fecha TEXT,
        total REAL
      )
    ''');

    await db.execute('''
      CREATE TABLE detalle_compra(
        id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
        id_compra INTEGER,
        producto TEXT,
        cantidad INTEGER,
        precio REAL,
        FOREIGN KEY (id_compra) REFERENCES compra(id_compra)
      )
    ''');
  }

  Future<int> insertCompra(
    Map<String, dynamic> compra,
    List<Map<String, dynamic>> carrito,
  ) async {
    final db = await database;
    int idCompra = await db!.insert('compra', compra);

    // Insertar los detalles de la compra
    for (var item in carrito) {
      await db.insert('detalle_compra', {
        'id_compra': idCompra,
        'producto': item['name'],
        'cantidad': item['cantidad'],
        'precio': item['price'],
      });
    }

    return idCompra;
  }

  Future<List<DetalleCompra>> selectDetalles(int idCompra) async {
    final db = await database;
    final result = await db!.query(
      'detalle_compra',
      where: 'id_compra = ?',
      whereArgs: [idCompra],
    );

    return result.map((mapa) => DetalleCompra.fromMap(mapa)).toList();
  }

  Future<void> clearAll() async {
    final db = await database;
    await db!.delete('detalle_compra');
    await db.delete('compra');
  }

  Future<List<Map<String, dynamic>>> selectAllCompras() async {
  final db = await database;
  final result = await db!.query('compra', orderBy: 'id_compra DESC');
  return result;
}

}

class DetalleCompra {
  int? idDetalle;
  int? idCompra;
  String? producto;
  int? cantidad;
  double? precio;

  DetalleCompra({
    this.idDetalle,
    this.idCompra,
    this.producto,
    this.cantidad,
    this.precio,
  });

  factory DetalleCompra.fromMap(Map<String, dynamic> map) {
    return DetalleCompra(
      idDetalle: map['id_detalle'],
      idCompra: map['id_compra'],
      producto: map['producto'],
      cantidad: map['cantidad'],
      precio: (map['precio'] ?? 0).toDouble(),
    );
  }
}
