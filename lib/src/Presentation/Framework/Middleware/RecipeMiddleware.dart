/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:redux/redux.dart';
import 'package:shopping_helper/src/Domain/Repository/IRecipeRepository.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

List<Middleware<AppState>> getRecipeMiddleware(IRecipeRepository recipeRepo) {
    return [
        TypedMiddleware<AppState, LoadRecipeListAction>(
            _getRecipeList(recipeRepo)),
        TypedMiddleware<AppState, CreateRecipeAction>(
            _createRecipe(recipeRepo)),
        TypedMiddleware<AppState, UpdateRecipeAction>(
            _updateRecipe(recipeRepo)),
        TypedMiddleware<AppState, RemoveRecipeAction>(
            _removeRecipe(recipeRepo)),
        TypedMiddleware<AppState, RemoveAllRecipesAction>(
            _removeAllRecipes(recipeRepo)),
    ];
}

void Function(
    Store<AppState> store,
    LoadRecipeListAction action,
    NextDispatcher next,
    ) _getRecipeList(IRecipeRepository repository) {
    return (store, action, next) {
        repository.getAll().then((_) {
            next(RecipeListLoadedAction(_));
        });
    };
}

void Function(
    Store<AppState> store,
    RemoveRecipeAction action,
    NextDispatcher next,
    ) _removeRecipe(IRecipeRepository repository) {
    return (store, action, next) {
        repository.remove(action.recipe.id).then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    RemoveAllRecipesAction action,
    NextDispatcher next,
    ) _removeAllRecipes(IRecipeRepository repository) {
    return (store, action, next) {
        repository.removeAll().then((_) {
            next(action);
        });
    };
}

void Function(
    Store<AppState> store,
    CreateRecipeAction action,
    NextDispatcher next,
    ) _createRecipe(IRecipeRepository repository) {
    return (store, action, next) {
        repository.insert(action.recipe).then((_) {
            next(action);
        });
        store.dispatch(LoadRecipeListAction());
    };
}

void Function(
    Store<AppState> store,
    UpdateRecipeAction action,
    NextDispatcher next,
    ) _updateRecipe(IRecipeRepository repository) {
    return (store, action, next) {
        repository.update(action.recipe).then((_) {
            next(action);
        });
        store.dispatch(LoadRecipeListAction());
    };
}
