/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Repository/IShopRepository.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

List<Middleware<AppState>> getShopMiddleware(IShopRepository shopRepo) {
    return [
        TypedMiddleware<AppState, LoadShopListAction>(
            _getShopList(shopRepo)),
        TypedMiddleware<AppState, CreateShopAction>(
            _createShop(shopRepo)),
        TypedMiddleware<AppState, RemoveShopAction>(
            _removeShop(shopRepo)),
    ];
}

void Function(
    Store<AppState> store,
    LoadShopListAction action,
    NextDispatcher next,
    ) _getShopList(IShopRepository repository) {
    return (store, action, next) {
        repository.getAll().then((_) {
            next(ShopListLoadedAction(_));
        });
    };
}

void Function(
    Store<AppState> store,
    RemoveShopAction action,
    NextDispatcher next,
    ) _removeShop(IShopRepository repository) {
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
    ) _createShop(IShopRepository repository) {
    return (store, action, next) {
        repository.insert(action.shop).then((_) {
            next(action);
        });
        store.dispatch(LoadShopListAction());
    };
}
