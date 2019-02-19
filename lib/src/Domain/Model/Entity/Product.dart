/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Exception/ArgumentException.dart';

class Product {
    int _id;
    int _shopId;
    String _name;
    int _price;

    Product(int id, int shopId, String name, int price) {
      id == null ? throw ArgumentException : this._id = id;
      shopId == null ? throw ArgumentException : this._shopId = shopId;
      name == null ? throw ArgumentException : this._name = name;
      price == null ? throw ArgumentException : this._price = price;
    }

    int get id => _id;

    int get shopId => _shopId;

    String get name => _name;

    int get price => _price;

    factory Product.fromJson(Map<String, dynamic> json) =>
        Product(
            json["id"],
            json["shop_id"],
            json["name"],
            json["price"],
        );

    Map<String, dynamic> toJson() =>
        {
            "id": id,
            "shop_id": shopId,
            "name": name,
            "price": price,
        };
}
