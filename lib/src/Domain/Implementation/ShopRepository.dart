/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Domain/Repository/IShopRepository.dart';
import 'package:shopping_helper/src/Infrastructure/Implementation/SQLiteDatabaseService.dart';

class ShopRepository implements IShopRepository {
    static final ShopRepository instance = ShopRepository._();
    static final String _tableName = 'shop';
    final SQLiteDatabaseService _databaseService = SQLiteDatabaseService(_tableName);

    ShopRepository._();

    @override
    Future<Shop> getById(int id) async {
        List<Map<String, dynamic>> dataset = await _databaseService.findById(id);
        if (dataset.length != 1) {
            throw Exception;
        }
        return Shop.fromJson(dataset.first);
    }

    @override
    Future<List<Shop>> getAll() async{
        List<Map<String, dynamic>> dataset = await _databaseService.findAll();
        List<Shop> result = [];
        for (Map<String, dynamic> data in dataset) {
            if (data.isNotEmpty) {
                result.add(Shop.fromJson(data));
            }
        }
        return result;
    }

    @override
    Future save(Shop shop) async {
        bool result = await _databaseService.save(shop.toJson());
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
}
