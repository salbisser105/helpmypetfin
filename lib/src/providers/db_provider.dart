import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:helpmypetfin/src/models/scan_model.dart';
export 'package:helpmypetfin/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';


class DBProvider {

static Database _database;
static final DBProvider db = DBProvider._();
//Hace la base de datos buscando que solo se pueda tener 1 instancia de esta base.
DBProvider._();

Future<Database>get database async {

if(_database !=null) return _database;
// La instancia seria nula entonces se debe crear una nueva.
_database = await initDB();

return _database;
}

initDB() async {
//Se debe ver donde esta el path.
Directory documentsDirectory = await getApplicationDocumentsDirectory();

final path = join(documentsDirectory.path, 'ScansDB.db');

return await openDatabase(
  path,
  version: 1,
  onOpen: (db){},
  onCreate: (Database db, int version) async {
    await db.execute(
      'CREATE TABLE Scans ('
      'id INTEGER PRIMARY KEY,'
      'tipo TEXT,'
      'valor TEXT'
      ')'
    );
  }

);

}

//Crear registros en la base de datos.
nuevoScan( ScanModel nuevoScan) async {
  final db = await database;
  final res = await db.insert('Scans', nuevoScan.toJson());
  return res;
}

//Select o obtener la informacion de la base de datos.
Future<ScanModel>getScanId(int id )async {
final db = await database;
final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;

}
//Aca obtengo un listado de mapas.
Future<List<ScanModel>> getTodosScans() async {
  final db = await database;
  final res = await db.query('Scans');

  List<ScanModel> list = res.isNotEmpty ? res.map( (c)=> ScanModel.fromJson(c)).toList()
  : [];
  return list;
}
Future<List<ScanModel>> getScansPorTipo(String tipo) async {
  final db = await database;
  final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo='$tipo'");

  List<ScanModel> list = res.isNotEmpty ? res.map( (c)=> ScanModel.fromJson(c)).toList()
  : [];
  return list;
}

//Metodo para actualizar los registros de la base de datos.

Future<int> updateScan(ScanModel nuevoScan) async {

final db = await database;
final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id] );

return res;

}

//Metodo para borrar registros de la base de datos.
Future<int> deleteScan(int id )async {
final db = await database;
final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

return res;
}

}

