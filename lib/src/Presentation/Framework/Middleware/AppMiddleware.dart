/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Implementation/ProductRepository.dart';
import 'package:shopping_helper/src/Domain/Implementation/RecipeRepository.dart';
import 'package:shopping_helper/src/Domain/Implementation/ShopRepository.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'ProductMiddleware.dart';
import 'ShopMiddleware.dart';
import 'RecipeMiddleware.dart';

List<Middleware<AppState>> init(ProductRepository productRepo,
    ShopRepository shopRepo,
    RecipeRepository recipeRepo) {
    List<Middleware<AppState>> appMiddleware = [
        TypedMiddleware<AppState, InitAppAction>(
            _initApp(productRepo, shopRepo, recipeRepo)),
    ];
    appMiddleware
        ..addAll(getProductMiddleware(productRepo))
        ..addAll(getShopMiddleware(shopRepo))
        ..addAll(getRecipeMiddleware(recipeRepo));
    return appMiddleware;
}

void Function(
    Store<AppState> store,
    InitAppAction action,
    NextDispatcher next,
    ) _initApp(ProductRepository productRepo, ShopRepository shopRepo, RecipeRepository recipeRepo) {
    return (store, action, next) {
        next(LoadProductListAction());
        next(LoadShopListAction());
        next(LoadRecipeListAction());
        next(action);
        //List<Shop> shopList = await shopRepo.getAll();
    };
}





