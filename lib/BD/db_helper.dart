import 'package:flutter/material.dart';
import 'package:gym_app/BD/exercises_dao.dart';
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
        '''CREATE TABLE workouts (id INTEGER PRIMARY KEY,name TEXT,exerc_list INTEGER)''');

    await db.execute(
        '''CREATE TABLE exercises (id TEXT, name TEXT, gifUrl TEXT, equipment TEXT, bodyPart TEXT, target TEXT)''');

    await db.execute(
        '''CREATE TABLE exercises_list (w_id INTEGER, ex_id INTEGER)''');

    await db.execute(
        '''CREATE TABLE profile (id INTEGER PRIMARY KEY, name TEXT, height TEXT, weight TEXT)''');

    await db.execute(
        '''CREATE TABLE weights_list (p_id INTEGER PRIMARY KEY, w1 INTEGER NULL, w2 INTEGER NULL, w3 INTEGER NULL, w4 INTEGER NULL, w5 INTEGER NULL, w6 INTEGER NULL, w7 INTEGER NULL, w8 INTEGER NULL, w9 INTEGER NULL, w10 INTEGER NULL, w11 INTEGER NULL, w12 INTEGER NULL)''');

    await db
        .execute('''CREATE TABLE classes (day TEXT PRIMARY KEY, hour TEXT)''');
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
