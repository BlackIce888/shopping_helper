/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

abstract class ISQLiteDatabaseService {
  Future<List<Map<String, dynamic>>> findAll();

  Future<List<Map<String, dynamic>>> findById(int id);

  Future<bool> save(Map<String, dynamic> values);

  Future<bool> remove(int id);
}
