/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/ProductActions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/ShoppingActions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

class ProductViewModel {
    final String pageTitle = 'Product List';
    final AppState appState;
    final Function() onAddProduct;
    final Function() onRemoveAllProducts;
    final Function(Product) onRemoveProduct;
    final Function(Product) onAddToShoppingList;


    ProductViewModel({
        this.appState,
        this.onAddProduct,
        this.onRemoveAllProducts,
        this.onRemoveProduct,
        this.onAddToShoppingList,
    });

    factory ProductViewModel.create(Store<AppState> store) {

        _onRemoveAllProducts() {
            store.dispatch(RemoveAllProductsAction());
        }

        _onRemoveProduct(Product product) {
            store.dispatch(RemoveProductAction(product));
        }

        _onAddToShoppingList(Product product) {
            store.dispatch(AddToShoppingListAction(product));
        }

        return ProductViewModel(
            appState: store.state,
            onRemoveAllProducts: _onRemoveAllProducts,
            onRemoveProduct: _onRemoveProduct,
            onAddToShoppingList: _onAddToShoppingList,
        );
    }
}
