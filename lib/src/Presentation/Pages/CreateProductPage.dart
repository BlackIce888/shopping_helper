/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_helper/src/Presentation/Components/CreateProductForm.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/CreateProductViewModel.dart';

class CreateProductPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Create Product'),
            ),
            body: StoreConnector<AppState, CreateProductViewModel>(
                converter: (Store<AppState> store) => CreateProductViewModel.create
                    (store),
                builder: (BuildContext context, CreateProductViewModel viewModel) =>
                    Column(
                        children: <Widget>[
                            CreateProductForm(viewModel),
                        ],
                    ),
            ),
        );
    }
}
