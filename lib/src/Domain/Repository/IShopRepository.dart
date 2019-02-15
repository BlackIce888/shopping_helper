/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';

abstract class IShopRepository {
  List<Shop>getAll();
  Shop findById(int id);
  Future<void> save();
  Future<void> remove(int id);
}