/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Reducers/AppStateReducer.dart';
import 'package:shopping_helper/src/Presentation/Pages/ProductPage.dart';

void main() => runApp(ShoppingHelperApp());

class ShoppingHelperApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final Store<AppState> store = Store<AppState>(
            appStateReducer,
            middleware: [thunkMiddleware],
            initialState: AppState.initialState(),
        );

        return StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
                title: 'ShoppingHelper App',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                ),
                home: ProductPage(),
                routes:
                <String, WidgetBuilder>{
                    //'/home': (BuildContext context) => HomePage(),
                    '/products': (BuildContext context) => ProductPage(),
                    //'/recipes': (BuildContext context) => RecipesPage(),
                    //'/products/createItem': (BuildContext context) => CreateProductPage(),
                },
            ),
        );
    }
}
