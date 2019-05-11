/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_helper/src/Presentation/Components/ShoppingListView.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/ShoppingViewModel.dart';
import 'package:shopping_helper/src/Presentation/Components/Components.dart';

class ShoppingPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Shopping List'),
            ),
            drawer: MainNavigation(),
            body: StoreConnector<AppState, ShoppingViewModel>(
                converter: (Store<AppState> store) =>
                    ShoppingViewModel.create(store),
                builder: (BuildContext context, ShoppingViewModel viewModel) =>
                    Column(
                        children: <Widget>[
                            Expanded(child: ShoppingListView(viewModel)),
                            RemoveButton('Delete all', 'Are you sure you want to clear your Shopping List?', viewModel.onClearShoppingList),
                        ],
                    ),
            ),
        );
    }
}
