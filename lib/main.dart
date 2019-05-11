/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Implementation/ProductRepository.dart';
import 'package:shopping_helper/src/Domain/Implementation/RecipeRepository.dart';
import 'package:shopping_helper/src/Domain/Implementation/ShopRepository.dart';
import 'package:shopping_helper/src/Infrastructure/Implementation/SQLiteDatabaseService.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Reducers/AppStateReducer.dart';
import 'package:shopping_helper/src/Presentation/Pages/CreateProductPage.dart';
import 'package:shopping_helper/src/Presentation/Pages/PageContainer.dart';
import 'package:shopping_helper/src/Presentation/Pages/ProductPage.dart';
import 'package:shopping_helper/src/Presentation/Pages/ShoppingPage.dart';
import 'package:shopping_helper/src/Presentation/Framework/Middleware/AppMiddleware.dart';

void main() => runApp(ShoppingHelperApp());

class ShoppingHelperApp extends StatelessWidget {

    final Store<AppState> store;

    ShoppingHelperApp({
        Key key,
    }) : store = Store<AppState>(
        appStateReducer,
        middleware: init(
            ProductRepository(SQLiteDatabaseService('product')),
            ShopRepository(SQLiteDatabaseService('shop')),
            RecipeRepository(SQLiteDatabaseService('recipe')),
        ),
        initialState: AppState.initialState(),
    ),
    super(key: key) {
        store.dispatch(InitAppAction());
    }

    @override
    Widget build(BuildContext context) {
        return StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
                title: 'ShoppingHelper App',
                theme: ThemeData(
                    primarySwatch: Colors.teal,
                ),
                home: PageContainer(),
                routes:
                <String, WidgetBuilder>{
                    '/index': (BuildContext context) => PageContainer(),
                    '/createProduct': (BuildContext context) => CreateProductPage(),
                },
            ),
        );
    }
}
