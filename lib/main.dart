/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:shopping_helper/src/Domain/Implementation/ProductRepository.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/components/components.dart';

void main() => runApp(ShoppingHelperApp());

class ShoppingHelperApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        ProductRepository productRepository = ProductRepository.instance;
        Future<List<Product>> productList = productRepository.getAll();

        return MaterialApp(
            title: 'Welcome to Flutter',
            home: Scaffold(
                appBar: AppBar(
                    title: Text('Welcome to Flutter'),
                ),
                body: Column(
                    children: <Widget>[
                        Expanded(child: ItemListWidget(productList)),
                        //Expanded(child: Text('hi')),
                        RemoveItemsButton(),
                    ],
                ),
            ),
        );
    }
}
