/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/ProductActions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

class ProductViewModel {
    final String pageTitle = 'Product List';
    final List<Product> productList;
    final Function() onAddProduct;
    final Function(Product) onRemoveProduct;
    final Function() onRemoveAllProducts;

    ProductViewModel({
        this.productList,
        this.onAddProduct,
        this.onRemoveProduct,
        this.onRemoveAllProducts
    });

    factory ProductViewModel.create(Store<AppState> store) {
        _onRemoveProduct(Product product) {
            store.dispatch(RemoveProductAction(product));
        }

        _onRemoveAllProducts() {
            store.dispatch(RemoveAllProductsAction());
        }

        return ProductViewModel(
            productList: store.state.productList,
            onRemoveProduct: _onRemoveProduct,
            onRemoveAllProducts: _onRemoveAllProducts,
        );
    }
}
