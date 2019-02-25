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
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Reducers/AppStateReducer.dart';
import 'package:shopping_helper/src/Presentation/Pages/CreateProductPage.dart';
import 'package:shopping_helper/src/Presentation/Pages/ProductPage.dart';
import 'package:shopping_helper/src/Presentation/Pages/ShoppingPage.dart';
import 'package:shopping_helper/src/Presentation/Framework/Middleware/AppMiddleware.dart';

void main() => runApp(ShoppingHelperApp());

class ShoppingHelperApp extends StatelessWidget {

    final Store<AppState> store;

    ShoppingHelperApp({
        Key key,
        ProductRepository productRepository
    }) : store = Store<AppState>(
        appStateReducer,
        middleware: init(
            ProductRepository.instance,
            ShopRepository.instance,
            RecipeRepository.instance
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
                home: ProductPage(),
                routes:
                <String, WidgetBuilder>{
                    '/shopping': (BuildContext context) => ShoppingPage(),
                    '/products': (BuildContext context) => ProductPage(),
                    //'/recipes': (BuildContext context) => RecipesPage(),
                    '/products/create': (BuildContext context) => CreateProductPage(),
                },
            ),
        );
    }
}
