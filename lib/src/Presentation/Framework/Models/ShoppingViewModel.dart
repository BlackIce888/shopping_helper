/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/ShoppingActions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

class ShoppingViewModel {
    final String pageTitle = 'Shopping List';
    final AppState appState;
    final Function(Product) onRemoveFromShoppingList;
    final Function() onClearShoppingList;

    ShoppingViewModel({
        this.appState,
        this.onRemoveFromShoppingList,
        this.onClearShoppingList,
    });

    factory ShoppingViewModel.create(Store<AppState> store) {

        _onRemoveFromShoppingList(Product product) {
            store.dispatch(RemoveFromShoppingListAction(product));
        }

        _onClearShoppingList() {
            store.dispatch(ClearShoppingListAction());
        }

        return ShoppingViewModel(
            appState: store.state,
            onRemoveFromShoppingList: _onRemoveFromShoppingList,
            onClearShoppingList: _onClearShoppingList,
        );
    }
}
