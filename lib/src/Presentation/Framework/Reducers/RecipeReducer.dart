/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/Actions.dart';

List<Recipe> recipeReducer(List<Recipe> state, action) {
    if (action is RecipeListLoadedAction) {
        return []
            ..addAll(action.recipeList);
    }

    if (action is CreateRecipeAction) {
        return []
            ..addAll(state)
            ..add(action.recipe);
    }

    if (action is UpdateRecipeAction) {
        return []
            ..addAll(state)
            ..removeWhere((recipe) => recipe.id == action.recipe.id)
            ..add(action.recipe);
    }

    if (action is RemoveRecipeAction) {
        return List.unmodifiable(List.from(state)
            ..remove(action.recipe));
    }

    if (action is RemoveAllRecipesAction) {
        return List.unmodifiable([]);
    }

    return state;
}

