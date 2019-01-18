import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_shopping_helper/src/components/components.dart';
import 'package:my_shopping_helper/src/models/models.dart';

class ProductsPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Products'),
            ),
            drawer: MainNavigation(),
            body: StoreConnector<AppState, HomeViewModel>(
                converter: (Store<AppState> store) => HomeViewModel.create
                    (store),
                builder: (BuildContext context, HomeViewModel viewModel) =>
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