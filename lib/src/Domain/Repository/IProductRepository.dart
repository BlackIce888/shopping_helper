/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';

abstract class IProductRepository {
    Future<List<Product>> getAll();

    Future<Product> getById(int id);

    void update(Product product);

    void insert(Product product);

    void remove(int id);

    void removeAll();
}
