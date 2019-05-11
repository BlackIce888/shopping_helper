/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';

abstract class IProductRepository {
    Future<List<Product>> getAll();

    Future<Product> getById(int id);

    Future update(Product product);

    Future insert(Product product);

    Future remove(int id);

    Future removeAll();
}
