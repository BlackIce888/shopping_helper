/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';

List<Product> productReducer(List<Product> state, action) {
    if (action is ProductListLoadedAction) {
        return []
            ..addAll(action.productList);
    }

    if (action is CreateProductAction) {
        return []
            ..addAll(state)
            ..add(action.product);
    }

    if (action is UpdateProductAction) {
        int index = state.indexWhere((product) => product.id == action.product.id);
        return []
            ..addAll(state)
            ..removeAt(index)
            ..insert(index, action.product);
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
