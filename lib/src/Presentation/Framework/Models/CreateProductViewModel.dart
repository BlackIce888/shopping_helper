/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/ProductActions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

class CreateProductViewModel {
    final String pageTitle = 'Add Product';
    final String name;
    final int shopId;
    final int price;
    final List<DropdownMenuItem> dropdownList;
    final Function(Product) onCreateProduct;

    CreateProductViewModel({
        this.name,
        this.shopId,
        this.price,
        this.dropdownList,
        this.onCreateProduct,
    });

    //store.state.shopList

    factory CreateProductViewModel.create(Store<AppState> store) {
        List<DropdownMenuItem> dropdownItems = [];
        for (Shop shop in store.state.shopList) {
            dropdownItems.add(
                DropdownMenuItem(
                    value: shop.id,
                    child: Text(shop.name)
                )
            );
        }
        dropdownItems.add(
            DropdownMenuItem(
                value: 0,
                child: FlatButton(
                    onPressed: null,
                    child: Row(
                        children: <Widget>[
                            Icon(Icons.add_circle),
                            Text('Add shop'),
                        ],
                    ),
                ),
            )
        );

        _onCreateProduct(Product product) {
            store.dispatch(CreateProductAction(product));
        }

        return CreateProductViewModel(
            dropdownList: dropdownItems,
            onCreateProduct: _onCreateProduct,
        );
    }
}
