/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Implementation/ProductRepository.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

List<Middleware<AppState>> getProductMiddleware(ProductRepository productRepo) {
    return [
        TypedMiddleware<AppState, GetProductListAction>(
            _getProductList(productRepo)),
        TypedMiddleware<AppState, CreateProductAction>(
            _createProduct(productRepo)),
        TypedMiddleware<AppState, RemoveProductAction>(
            _removeProduct(productRepo)),
    ];
}

void Function(
    Store<AppState> store,
    GetProductListAction action,
    NextDispatcher next,
    ) _getProductList(ProductRepository repository) {
    return (store, action, next) {
        repository.getAll().then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    RemoveProductAction action,
    NextDispatcher next,
    ) _removeProduct(ProductRepository repository) {
    return (store, action, next) {
        repository.remove(action.product.id).then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    CreateProductAction action,
    NextDispatcher next,
    ) _createProduct(ProductRepository repository) {
    return (store, action, next) {
        repository.save(action.product).then((_) {
            next(action);
        });
    };
}
