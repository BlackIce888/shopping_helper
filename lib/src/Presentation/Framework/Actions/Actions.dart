/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

export 'ProductActions.dart';
export 'ShopActions.dart';
export 'RecipeActions.dart';

import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';

class InitAppAction {}

class InitDataAction {
    final List<Product> productList;
    final List<Shop> shopList;
    final List<Recipe> recipeList;

    InitDataAction(this.productList, this.shopList, this.recipeList);
}
