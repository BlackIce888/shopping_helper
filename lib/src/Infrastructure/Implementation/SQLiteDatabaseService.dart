/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Infrastructure/Service/ISQLiteDatabaseService.dart';
import 'package:shopping_helper/src/Infrastructure/Util/LocalSQLiteDatabase.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDatabaseService implements ISQLiteDatabaseService {
    final Future<Database> _db = LocalSQLiteDatabase.instance.database;
    final String _tableName;

    SQLiteDatabaseService(this._tableName);

    @override
    Future<List<Map<String, dynamic>>> findAll() async {
        Database database = await _db;
        List<Map<String, dynamic>> result = await database.query(_tableName);
        if (result == null) {
            throw DatabaseException;
        }
        return result;
    }

    @override
    Future<List<Map<String, dynamic>>> findById(int id) async {
        Database database = await _db;
        List<Map<String, dynamic>> result = await database.query(
            _tableName, where: 'id = ?', whereArgs: [id]);
        if (result == null) {
            throw DatabaseException;
        }
        return result;
    }

    @override
    Future<bool> remove(int id) async {
        Database database = await _db;
        try {
            await database.delete(_tableName, where: 'id = ?', whereArgs: [id]);
            return true;
        } catch (Exception) {
            return false;
        }
    }

    @override
    Future<bool> removeAll() async {
        Database database = await _db;
        try {
            await database.delete(_tableName);
            return true;
        } catch (Exception) {
            return false;
        }
    }

    @override
    Future<bool> update(Map<String, dynamic> values) async {
        Database database = await _db;
        try {
            if (values.containsKey('id')) {
                await database.update(_tableName, values, where: 'id = ?', whereArgs: [values['id']]);
                return true;
            } else return false;


        } catch (Exception) {
            return false;
        }
    }

    @override
    Future<bool> insert(Map<String, dynamic> values) async {
        Database database = await _db;
        try {
            await database.insert(_tableName, values);
            return true;
        } catch (Exception) {
            return false;
        }
    }
}
