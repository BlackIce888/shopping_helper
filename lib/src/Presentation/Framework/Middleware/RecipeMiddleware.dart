/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Implementation/RecipeRepository.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

List<Middleware<AppState>> getRecipeMiddleware(RecipeRepository recipeRepo) {
    return [
        TypedMiddleware<AppState, GetRecipeListAction>(
            _getRecipeList(recipeRepo)),
        TypedMiddleware<AppState, CreateRecipeAction>(
            _createRecipe(recipeRepo)),
        TypedMiddleware<AppState, RemoveRecipeAction>(
            _removeRecipe(recipeRepo)),
    ];
}

void Function(
    Store<AppState> store,
    GetRecipeListAction action,
    NextDispatcher next,
    ) _getRecipeList(RecipeRepository repository) {
    return (store, action, next) {
        repository.getAll().then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    RemoveRecipeAction action,
    NextDispatcher next,
    ) _removeRecipe(RecipeRepository repository) {
    return (store, action, next) {
        repository.remove(action.recipe.id).then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    CreateRecipeAction action,
    NextDispatcher next,
    ) _createRecipe(RecipeRepository repository) {
    return (store, action, next) {
        repository.save(action.recipe).then((_) {
            next(action);
        });
    };
}
