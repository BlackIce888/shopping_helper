/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/foundation.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';

class AppState {
    final Map<Product, int> shoppingList;
    final List<Product> productList;
    final List<Shop> shopList;
    final List<Recipe> recipeList;

    AppState({@required this.shoppingList, @required this.productList, @required this.shopList, @required this.recipeList});

    AppState.initialState() :
            shoppingList = Map.unmodifiable(<Product, int>{}),
            productList = List.unmodifiable(<Product>[]),
            shopList = List.unmodifiable(<Shop>[]),
            recipeList = List.unmodifiable(<Recipe>[]);
}
