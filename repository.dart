import 'package:flutter/material.dart';
import 'package:myproject/Oflinedatabse/Databaseconnection.dart';
import 'package:sqflite/sqlite_api.dart';

class Repository {
// constructor
  late Databaseconnection _databaseconnection;
  Repository() {
    _databaseconnection = Databaseconnection(); //initlization
  }

  static Database? _database;

  Future<Database> get myDatabase async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _databaseconnection.setDatabase() ;
      return _database!;
    }
  }

  // insert into table
  insertREcord(table, data) async {
    var dbcon = await myDatabase;
    return await dbcon.insert(table, data);
  }

  // Fetch all records from the table
  FetchRecord(table) async {
    var dbcon = await myDatabase;
    return await dbcon.query(table);
  }

  FetchsingleRecord(table, data) async {
    var dbcon = await myDatabase;
    return await dbcon.query(table, where: "id = ?", whereArgs: [data["id"]]);
  }

  UpdateRecord(table, data) async {
    var dbcon = await myDatabase;
    return await dbcon.update(table, data, where: "id = ?", whereArgs: [data["id"]]);
  }

  deletRecord(table, data) async {
    var dbcon = await myDatabase;
    return await dbcon.delete(table,where: "id = ?",whereArgs: [data["id"]]);
  }
}