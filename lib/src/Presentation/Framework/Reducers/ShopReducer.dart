/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';

List<Shop> shopReducer(List<Shop> state, action) {
    if (action is ShopListLoadedAction) {
        return []
            ..addAll(action.shopList);
    }

    if (action is CreateShopAction) {
        return []
            ..addAll(state)
            ..add(action.shop);
    }

    if (action is RemoveShopAction) {
        return List.unmodifiable(List.from(state)
            ..remove(action.shop));
    }

    return state;
}
