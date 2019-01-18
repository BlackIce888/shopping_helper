import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:my_shopping_helper/src/models/appState.dart';
import 'package:my_shopping_helper/src/reducers/reducers.dart';
import 'package:my_shopping_helper/src/presentation/views.dart';

class ShoppingHelperApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final Store<AppState> store = Store<AppState>(
            appStateReducer,
            initialState: AppState.initialState(),
        );

        return StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
                title: 'myLittleShoppingHelper App',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                ),
                home: HomePage(),
                routes: <String, WidgetBuilder>{
                    '/home': (BuildContext context) => HomePage(),
                    '/products': (BuildContext context) => ProductsPage(),
                    '/recipes': (BuildContext context) => RecipesPage(),
                    '/products/createItem': (BuildContext context) =>
                        CreateProductPage(),
                },
            ),
        );
    }
}