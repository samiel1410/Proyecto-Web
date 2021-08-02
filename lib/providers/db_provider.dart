import 'dart:io';

import 'package:pagosapp_group/src/models/goal_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  Future<Database> initDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, 'AppPay.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Goals(
          id  INTEGER PRIMARY KEY,
          name TEXT,          
          credit DOUBLE
        )      
      ''');
    });
  }

  Future<int> insert(Goal newElement) async {
    final db = await database;
    final newId = await db.insert('Goals', newElement.toJson());
    return newId;
  }

  Future<dynamic> list() async {
    final db = await database;
    final result = await db.query('Goals');
    return result.isNotEmpty
        ? result.map((t) => Goal.fromJson(t)).toList()
        : [];
  }
}
