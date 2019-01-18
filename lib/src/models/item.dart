import 'package:flutter/foundation.dart';

class Item {
    final int id;
    final String name;
    final int count;
    final double price;
    final String shop;

    Item({
        @required this.id,
        @required this.name,
        this.count,
        this.price,
        this.shop,
    });

    Item copyWith({int id, String name, int count, double price, String shop}) {
        return Item(
            id: id ?? this.id,
            name: name ?? this.name,
            count: count ?? this.count,
            price: price ?? this.price,
            shop: shop ?? this.shop,
        );
    }
}