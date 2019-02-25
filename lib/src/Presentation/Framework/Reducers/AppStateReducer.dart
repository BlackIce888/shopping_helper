/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'package:shopping_helper/src/Presentation/Framework/Reducers/ProductReducer.dart';
import 'package:shopping_helper/src/Presentation/Framework/Reducers/RecipeReducer.dart';
import 'package:shopping_helper/src/Presentation/Framework/Reducers/ShopReducer.dart';
import 'package:shopping_helper/src/Presentation/Framework/Reducers/ShoppingListReducer.dart';

AppState appStateReducer(AppState state, action) {
    return AppState(
        shoppingList: shoppingListReducer(state.shoppingList, action),
        productList: productReducer(state.productList, action),
        shopList: shopReducer(state.shopList, action),
        recipeList: recipeReducer(state.recipeList, action),
    );
}
