/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Repository/IProductRepository.dart';
import 'package:shopping_helper/src/Infrastructure/Implementation/SQLiteDatabaseService.dart';

class ProductRepository implements IProductRepository {
    static final ProductRepository instance = ProductRepository._();
    static final String _tableName = 'product';
    final SQLiteDatabaseService _databaseService = SQLiteDatabaseService(_tableName);

    ProductRepository._();

    @override
    Future<Product> getById(int id) async {
        List<Map<String, dynamic>> dataset = await _databaseService.findById(id);
        if (dataset.length != 1) {
            throw Exception;
        }
        return Product.fromJson(dataset.first);
    }

    @override
    Future<List<Product>> getAll() async{
        List<Map<String, dynamic>> dataset = await _databaseService.findAll();
        List<Product> result = [];
        for (Map<String, dynamic> data in dataset) {
            if (data.isNotEmpty) {
                result.add(Product.fromJson(data));
            }
        }
        print(result);
        return result;
    }

    @override
    Future update(Product product) async {
        bool result = await _databaseService.update(product.toJson());
        if (!result) {
            throw Exception;
        }
    }

    @override
    Future insert(Product product) async {
        bool result = await _databaseService.insert(product.toJson());
        if (!result) {
            throw Exception;
        }
    }

    @override
    Future remove(int id) async {
        bool result = await _databaseService.remove(id);
        if (!result) {
            throw Exception;
        }
    }

    @override
    Future removeAll() async {
        bool result = await _databaseService.removeAll();
        if (!result) {
            throw Exception;
        }
    }
}
