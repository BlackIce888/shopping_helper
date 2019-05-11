/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Repository/IProductRepository.dart';
import 'package:shopping_helper/src/Domain/Repository/IRecipeRepository.dart';
import 'package:shopping_helper/src/Domain/Repository/IShopRepository.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';
import 'ProductMiddleware.dart';
import 'ShopMiddleware.dart';
import 'RecipeMiddleware.dart';

List<Middleware<AppState>> init(IProductRepository productRepo,
    IShopRepository shopRepo,
    IRecipeRepository recipeRepo) {
    List<Middleware<AppState>> appMiddleware = [
        TypedMiddleware<AppState, InitAppAction>(
            _initApp(productRepo, shopRepo, recipeRepo)),
    ];
    appMiddleware..addAll(getProductMiddleware(productRepo))..addAll(
        getShopMiddleware(shopRepo))..addAll(getRecipeMiddleware(recipeRepo));
    return appMiddleware;
}

void Function(
    Store<AppState> store,
    InitAppAction action,
    NextDispatcher next,
    ) _initApp(IProductRepository productRepo, IShopRepository shopRepo, IRecipeRepository recipeRepo) {
    return (store, action, next) {
        next(LoadProductListAction());
        next(LoadShopListAction());
        next(LoadRecipeListAction());
        next(action);
        //List<Shop> shopList = await shopRepo.getAll();
    };
}





