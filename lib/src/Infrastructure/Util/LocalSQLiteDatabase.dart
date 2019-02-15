/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class LocalSQLiteDatabase {
  static final LocalSQLiteDatabase instance = LocalSQLiteDatabase._();
  static Database _db;

  LocalSQLiteDatabase._();

  Future<Database> get database async {
    if(_db != null)
      return _db;
    _db = await _initDb();
    return _db;
  }

  _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "shopping-helper.db");

    // @todo Remove this when db should not be reset after restarts anymore
    await _deleteDb(path);


    return await openDatabase(path, version: 1, onConfigure: _onConfigure, onCreate: _onCreate);
  }

  _deleteDb(String path) async {
    if (FileSystemEntity.typeSync(path) != FileSystemEntityType.notFound) {
      if (await FileSystemEntity.isFile(path)) {
        await File(path).delete();
      }
    }
  }

  // Enable Foreign keys support
  Future _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON;");
  }

  // @todo Remove dummy inserts and add migration functionalities
  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE shop(id INTEGER PRIMARY KEY, name TEXT NOT NULL);");
    await db.execute("CREATE TABLE product(id INTEGER PRIMARY KEY, shop_id INTEGER, name TEXT, price INTEGER, FOREIGN KEY (shop_id) REFERENCES shop(id) ON DELETE CASCADE);");
    await db.execute("CREATE TABLE recipe(id INTEGER PRIMARY KEY, name TEXT, prep_time INTEGER, cook_time INTEGER, ingredients BLOB, instructions TEXT);");

    await db.execute(
        "INSERT INTO shop VALUES (1, 'Aldi');"
    );
    await db.execute(
        "INSERT INTO shop VALUES (2, 'Lidl');"
    );
    await db.execute(
        "INSERT INTO product VALUES (1, 1, 'Pringles', 229);"
    );
    await db.execute(
        "INSERT INTO product VALUES (2, 1, 'Kaffeefilter', 79);"
    );
    await db.execute(
        "INSERT INTO product VALUES (3, 2, 'Kaffeefilter', 89);"
    );
  }
}