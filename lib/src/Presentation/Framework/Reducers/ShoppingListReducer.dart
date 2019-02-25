/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';

Map<Product, int> shoppingListReducer(Map<Product, int> state, action) {
    if (action is AddToShoppingListAction) {
        return {}
            ..addAll(state)
            ..update(action.product, (val) => val + 1, ifAbsent: () => 1);
    }

    if (action is UpdateShoppingListAction) {
        return {}
            ..addAll(state)
            ..map((Product product, int val) {
                if (product.id != action.product.id) {
                    return MapEntry(product, val);
                } else {
                    return MapEntry(action.product, val);
                }
            });
    }

    if (action is RemoveFromShoppingListAction) {
        return Map.unmodifiable(Map.from(state)
            ..remove(action.product));
    }
    
    if (action is ClearShoppingListAction) {
        return Map.unmodifiable({});
    }

    return state;
}
