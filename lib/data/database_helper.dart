// import 'dart:io';
import 'dart:io' as io;
// import 'dart:typed_data';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:itca/models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'data_flutter.db');
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
    print('[DBHelper] initDB: Success');
    return db;
  }

  void _createTables(Database db, int version) async {
    await db.execute(
      'CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)',
    );
    print('[DBHelper] _createTables: Success');
   }
 }
