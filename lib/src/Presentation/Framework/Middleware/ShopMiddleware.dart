/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Implementation/ShopRepository.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

List<Middleware<AppState>> getShopMiddleware(ShopRepository shopRepo) {
    return [
        TypedMiddleware<AppState, GetShopListAction>(
            _getShopList(shopRepo)),
        TypedMiddleware<AppState, CreateShopAction>(
            _createShop(shopRepo)),
        TypedMiddleware<AppState, RemoveShopAction>(
            _removeShop(shopRepo)),
    ];
}

void Function(
    Store<AppState> store,
    GetShopListAction action,
    NextDispatcher next,
    ) _getShopList(ShopRepository repository) {
    return (store, action, next) {
        repository.getAll().then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    RemoveShopAction action,
    NextDispatcher next,
    ) _removeShop(ShopRepository repository) {
    return (store, action, next) {
        repository.remove(action.shop.id).then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    CreateShopAction action,
    NextDispatcher next,
    ) _createShop(ShopRepository repository) {
    return (store, action, next) {
        repository.save(action.shop).then((_) {
            next(action);
        });
    };
}
