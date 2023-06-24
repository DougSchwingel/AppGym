import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> getInstance() async {
    String dbName = 'GymApp.db';
    String path = await getDatabasesPath() + dbName;
    var instance = await openDatabase(path,
        version: 1,
        onCreate: _onCreate,
        onOpen: _onOpen,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade);

    return instance;
  }

  static Future<void> _onCreate(Database db, int ver) async {
    debugPrint(' ********************OnCreate******************** ');
    await db.execute(
        "CREATE TABLE aluno (id INTEGER PRIMARY KEY, matricula TEXT, nome TEXT)");
  }

  static Future<void> _onOpen(Database db) async {
    var ver = await db.getVersion();
    debugPrint(
        ' ********************Abrindo BD versão: $ver******************** ');
  }

  static Future<void> _onUpgrade(Database db, int oVer, int nVer) async {
    debugPrint(
        ' ********************Fazendo upgrade da versão: $oVer para a versão $nVer******************** ');
    //db.execute("");
  }

  static Future<void> _onDowngrade(Database db, int oVer, int nVer) async {
    debugPrint(
        ' ********************Fazendo downgrade da versão: $oVer para a versão $nVer******************** ');
    //db.execute("");
  }
}
