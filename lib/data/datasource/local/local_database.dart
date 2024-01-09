import 'dart:core';
import 'dart:ui';
import 'package:book_shop/domain/models/textfield_models/sign_user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? _database;
List wholeDataList = [];

class LocalDatabase {
  Future get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initializeDB('USERS');
    return _database;
  }

  Future _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
  CREATE TABLE LocalData (id INTEGER PRIMARY KEY,
  username TEXT,
  password1 TEXT,
  password2 TEXT,
  email TEXT,
  token TEXT)
  ''');
  }

  Future addDataLocally(SignUserModel model) async {
    final db = await database;
    await db.insert('LocalData',model.toJson()

    );
   
    return 'Added';
  }
  Future readAllData() async {
    final db = await database;
    final allData = await db.query('LocalData');
    wholeDataList = allData;
    var model= SignUserModel.fromJson(wholeDataList.first);
    return allData;
  }

  Future updateData(  SignUserModel model) async {
    final db = await database;
    // int dbupdateId=await db.rawUpdate('UPDATE LocalData SET Name= ? WHERE id=?',[Name,id]);
    int dbupdateId = await db
        .rawUpdate('UPDATE LocalData SET Token=? WHERE Name=?',model.toString());
  }

  Future deleteData(int id) async {
    final db = await database;
    await db.delete('LocalData', where: 'id=?', whereArgs: [id]);
  }

  Future clearAllData() async {
    final db = await database;
    await db.rawDelete("DELETE FROM LocalData");
    return 'All data cleared';
  }

  Future checkData(String name) async {
    final db = await database;
    final res =
        await db.rawQuery("SELECT * FROM LocalData WHERE Name=?", [name]);


  }

  Future<bool> hasToken() async {
    final db = await database;
    final res = await db.rawQuery('SELECT Token FROM LocalData');
    if (res.isEmpty) {


      return false;
    } else {


      return true;
    }
  }
}
