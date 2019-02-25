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
        TypedMiddleware<AppState, LoadProductListAction>(
            _getProductList(productRepo)),
        TypedMiddleware<AppState, UpdateProductAction>(
            _updateProduct(productRepo)),
        TypedMiddleware<AppState, CreateProductAction>(
            _createProduct(productRepo)),
        TypedMiddleware<AppState, RemoveProductAction>(
            _removeProduct(productRepo)),
        TypedMiddleware<AppState, RemoveAllProductsAction>(
            _removeAllProducts(productRepo)),
    ];
}

void Function(
    Store<AppState> store,
    LoadProductListAction action,
    NextDispatcher next,
    ) _getProductList(ProductRepository repository) {
    return (store, action, next) {
        repository.getAll().then((_) {
            next(ProductListLoadedAction(_));
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
    RemoveAllProductsAction action,
    NextDispatcher next,
    ) _removeAllProducts(ProductRepository repository) {
    return (store, action, next) {
        repository.removeAll().then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    UpdateProductAction action,
    NextDispatcher next,
    ) _updateProduct(ProductRepository repository) {
    return (store, action, next) {
        repository.update(action.product).then((_) {
            store.dispatch(LoadProductListAction());
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
        repository.insert(action.product).then((_) {
            store.dispatch(LoadProductListAction());
            next(action);
        });
    };
}
