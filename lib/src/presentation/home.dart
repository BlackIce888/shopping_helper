import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_shopping_helper/src/components/components.dart';
import 'package:my_shopping_helper/src/models/models.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) => StoreConnector<AppState,
    HomeViewModel> (
      converter: (Store<AppState> store) => HomeViewModel.create(store),
      builder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
          appBar: AppBar(
              title: Text(viewModel.pageTitle),
          ),
          drawer: MainNavigation(),
          body: Column(
              children: <Widget>[
                  Expanded(child: ItemListWidget(viewModel)),
                  RemoveItemsButton(viewModel),
              ],
          ),
          floatingActionButton: CreateProductButton(),
      ),
    );
}