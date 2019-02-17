/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/ProductViewModel.dart';
import 'package:shopping_helper/src/Presentation/components/components.dart';

class ProductPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Products'),
            ),
            drawer: MainNavigation(),
            body: StoreConnector<AppState, ProductViewModel>(
                converter: (Store<AppState> store) => ProductViewModel.create
                    (store),
                builder: (BuildContext context, ProductViewModel viewModel) =>
                    Column(
                        children: <Widget>[
                            Expanded(child: ItemListWidget(viewModel)),
                            RemoveItemsButton(viewModel),
                            CreateProductButton(),
                        ],
                    ),
            ),
        );
    }
}