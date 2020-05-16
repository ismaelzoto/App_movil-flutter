import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../models/usuario.dart';
export '../models/usuario.dart';

class DBProvider {

  static Database _database; 
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {

    if ( _database != null ) return _database;

    _database = await initDB();
    return _database;
  }


  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'UserDB.db' );

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
        await db.execute(
          'CREATE TABLE User ('
          ' id INTEGER PRIMARY KEY,'
          ' nombre TEXT,'
          ' apPaterno TEXT,'
          ' apMaterno TEXT,'
          ' edad TEXT,'
          ' telefono INTEGER,'
          ' direccion TEXT,'
          ')'
        );
      }
    
    );

  }

  // CREAR Registros
  // nuevoScanRaw( Usuario nuevo ) async {

  //   final db  = await database;

  //   final res = await db.rawInsert(
  //     "INSERT Into Scans (id, tipo, valor) "
  //     "VALUES ( ${ nuevo.id }, '${ nuevo.tipo }', '${ nuevo.valor }' )"
  //   );
  //   return res;

  // }

  nuevoUser( Usuario nuevo ) async {

    final db  = await database;
    final res = await db.insert('User',  nuevo.toJson());
    return res;
  }


  // SELECT - Obtener información
  Future<Usuario> getUserId( int id ) async {

    final db  = await database;
    final res = await db.query('User', where: 'id = ?', whereArgs: [id]  );
    return res.isNotEmpty ? Usuario.fromJson( res.first ) : null;

  }

  Future<List<Usuario>> getTodos() async {

    final db  = await database;
    final res = await db.query('User');

    List<Usuario> list = res.isNotEmpty 
                              ? res.map( (c) => Usuario.fromJson(c) ).toList()
                              : [];
    return list;
  }

  Future<List<Usuario>> getUserPorNombre( String nombre ) async {

    final db  = await database;
    final res = await db.rawQuery("SELECT * FROM User WHERE nombre='$nombre'");

    List<Usuario> list = res.isNotEmpty 
                              ? res.map( (c) => Usuario.fromJson(c) ).toList()
                              : [];
    return list;
  }

  // Actualizar Registros
  Future<int> updateUser( Usuario nuevo ) async {

    final db  = await database;
    final res = await db.update('User', nuevo.toJson(), where: 'id = ?', whereArgs: [nuevo.id] );
    return res;

  }

  // Eliminar registros
  Future<int> deleteUser( int id ) async {

    final db  = await database;
    final res = await db.delete('User', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {

    final db  = await database;
    final res = await db.rawDelete('DELETE FROM User');
    return res;
  }

}

