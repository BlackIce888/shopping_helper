/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:money/money.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/ShoppingViewModel.dart';
import 'package:shopping_helper/src/Presentation/Pages/UpdateProductPage.dart';

class ShoppingListView extends StatelessWidget {
    final ShoppingViewModel model;

    ShoppingListView(this.model);

    @override
    Widget build(BuildContext context) {
        Map<Product, int> _shoppingList = model.appState.shoppingList;
        List<Shop> _shopList = model.appState.shopList;
        List<Widget> _children = [];

        _shopList.forEach((Shop shop) {
            if (_shoppingList.keys.where((product) => product.shopId == shop.id).length > 0) {
                _children.add(
                    ListTile(
                        title: Text(shop.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                    )
                );
            }

            _shoppingList.forEach((Product product, int count) {
                if (product.shopId == shop.id) {
                    _children.add(
                        ListTile(
                            title: Text(product.name),
                            leading: Text(
                                count.toString() + 'x',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                            ),
                            trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => model.onRemoveFromShoppingList(product),
                            ),
                            subtitle: Text(
                                Money.fromDouble((product.price * count.toDouble()), Currency('EUR')).toString() +
                                    ' (' +
                                    count.toString() +
                                    ' x ' +
                                    Money.fromDouble(product.price, Currency('EUR')).toString() +
                                    ' )',
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                            onLongPress: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        UpdateProductPage(product)
                                ),
                                ),
                        ),
                    );
                }
            });


            _shoppingList.keys.where((product) => product.shopId == shop.id).map((Product product) {

            }).toList();
        });

        return ListView(
            children: _children
        );
    }
}
