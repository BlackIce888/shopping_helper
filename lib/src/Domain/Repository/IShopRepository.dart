/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';

abstract class IShopRepository {
    Future<List<Shop>> getAll();

    Future<Shop> getById(int id);

    void insert(Shop shop);

    void remove(int id);
}
