/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Components/ProductForm.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/CreateProductViewModel.dart';

class UpdateProductPage extends StatefulWidget {
    final Product product;

    UpdateProductPage(this.product);

    @override
    _UpdateProductPageState createState() => new _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Update Product (ID: ' + widget.product.id.toString() + ')'),
            ),
            body: StoreConnector<AppState, CreateProductViewModel>(
                converter: (Store<AppState> store) => CreateProductViewModel.create
                    (store),
                builder: (BuildContext context, CreateProductViewModel viewModel) =>
                    Column(
                        children: <Widget>[
                            ProductForm(viewModel, widget.product),
                        ],
                    ),
            ),
        );
    }
}
