/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';

List<Product> productReducer(List<Product> state, action) {
    if (action is GetProductListAction) {
        print('State: ');
        print(state);
        print('Action: ');
        print(action);
        print('Action.ProductList');
        print(action.productList);
        return []
            ..addAll(action.productList);
    }
    if (action is CreateProductAction) {
        return []
            ..addAll(state)
            ..add(action.product);
    }
    if (action is RemoveProductAction) {
        return List.unmodifiable(List.from(state)
            ..remove(action.product));
    }
    if (action is RemoveAllProductsAction) {
        return List.unmodifiable([]);
    }

    return state;
}
