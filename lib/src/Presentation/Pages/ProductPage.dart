/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/ProductViewModel.dart';
import 'package:shopping_helper/src/Presentation/Components/Components.dart';

class ProductPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Products'),
                actions: <Widget>[
                    IconButton(icon: Icon(Icons.filter), onPressed: () => _openFilterDialog(context)),
                ],
            ),
            drawer: MainNavigation(),
            body: StoreConnector<AppState, ProductViewModel>(
                converter: (Store<AppState> store) =>
                    ProductViewModel.create(store),
                builder: (BuildContext context, ProductViewModel viewModel) =>
                    Column(
                        children: <Widget>[
                            Expanded(child: ProductListView(viewModel)),
                            RemoveButton('Delete all', 'Are you sure you want to delete all products?', viewModel.onRemoveAllProducts),
                        ],
                    ),
            ),
            floatingActionButton: CreateProductButton(),
        );
    }

    _openFilterDialog(BuildContext context) async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Filter Options'),
                    content: Form(
                        key: Key('filters'),
                        child: Column(
                            children: <Widget>[
                                TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Product name',
                                    )
                                ),
                                DropdownButtonFormField<String>(
                                    value: 'below',
                                    items: [
                                        DropdownMenuItem(value: 'below', child: Text('below')),
                                        DropdownMenuItem(value: 'above', child: Text('above')),
                                    ],
                                    decoration: InputDecoration(
                                        labelText: 'Price',
                                    ),
                                ),
                                TextFormField(),
                                DropdownButtonFormField<String>(
                                    value: 'Aldi',
                                    items: [
                                        DropdownMenuItem(value: 'Aldi', child: Text('Aldi')),
                                        DropdownMenuItem(value: 'Lidl', child: Text('Lidl')),
                                        DropdownMenuItem(value: 'Penny', child: Text('Penny')),
                                    ],
                                    decoration: InputDecoration(
                                        labelText: 'Shop',
                                    ),
                                ),


                            ],
                        ),
                    ),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('Submit'),
                            onPressed: () {
                                Navigator.of(context).pop();
                            }
                        ),
                    ],
                );
            }
        );
    }
}
