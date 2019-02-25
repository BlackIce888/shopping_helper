/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

class CreateProductViewModel {
    final String pageTitle = 'Add Product';
    final List<Shop> shopList;
    final Function(Product) onCreateProduct;
    final Function(Product) onUpdateProduct;
    final Function(Shop) onCreateShop;

    CreateProductViewModel({
        this.shopList,
        this.onCreateProduct,
        this.onUpdateProduct,
        this.onCreateShop,
    });

    //store.state.shopList

    factory CreateProductViewModel.create(Store<AppState> store) {

        _onCreateProduct(Product product) {
            store.dispatch(CreateProductAction(product));
        }

        _onUpdateProduct(Product product) {
            store.dispatch(UpdateProductAction(product));
            store.dispatch(UpdateShoppingListAction(product));
        }

        _onCreateShop(Shop shop) {
            store.dispatch(CreateShopAction(shop));
        }

        return CreateProductViewModel(
            shopList: store.state.shopList,
            onCreateProduct: _onCreateProduct,
            onUpdateProduct: _onUpdateProduct,
            onCreateShop: _onCreateShop,
        );
    }
}
