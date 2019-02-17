/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:money/money.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/ProductViewModel.dart';

class ItemListWidget extends StatelessWidget {
    final ProductViewModel model;

    ItemListWidget(this.model);

    @override
    Widget build(BuildContext context) {
        return ListView(
            children: model.productList.map((Product product) =>
                ListTile(
                    title: Text(product.name),
                    leading: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => model.onRemoveProduct(product),
                    ),
                    trailing: Text(
                        Money(product.price, Currency('EUR')).toString()),
                )
            ).toList(),
        );
    }
}
