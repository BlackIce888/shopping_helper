/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:money/money.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/ProductViewModel.dart';
import 'package:shopping_helper/src/Presentation/Pages/UpdateProductPage.dart';

class ProductListView extends StatelessWidget {
    final ProductViewModel model;

    ProductListView(this.model);

    @override
    Widget build(BuildContext context) {
        List<Product> _productList = model.appState.productList;
        List<Shop> _shopList = model.appState.shopList;
        List<Widget> _children = [];

        _shopList.forEach((Shop shop) {
            if (_productList
                .where((product) => product.shopId == shop.id)
                .length > 0) {
                _children.add(
                    ListTile(
                        title: Text(shop.name, style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))
                    )
                );
            }
            _productList.where((product) => product.shopId == shop.id).map((
                Product product) {
                _children.add(
                    ListTile(
                        title: Text(product.name),
                        leading: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => model.onAddToShoppingList(product),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => model.onRemoveProduct(product),
                        ),
                        subtitle: Text(
                            Money.fromDouble(product.price, Currency('EUR'))
                                .toString()),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25.0),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UpdateProductPage(product)
                            ),
                        ),
                    ),
                );
            }).toList();
        });

        return ListView(
            children: _children
        );
    }
}
