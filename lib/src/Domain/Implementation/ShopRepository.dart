/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Domain/Repository/IShopRepository.dart';
import 'package:shopping_helper/src/Infrastructure/Service/IDatabaseService.dart';

class ShopRepository implements IShopRepository {
    final IDatabaseService _databaseService;

    ShopRepository(this._databaseService);

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
    Future insert(Shop shop) async {
        bool result = await _databaseService.insert(shop.toJson());
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
