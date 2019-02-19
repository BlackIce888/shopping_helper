/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';

class GetRecipeListAction {
    final List<Recipe> recipeList;

    GetRecipeListAction(this.recipeList);
}

class CreateRecipeAction {
  final Recipe recipe;

  CreateRecipeAction(this.recipe);
}

class RemoveRecipeAction {
  final Recipe recipe;

  RemoveRecipeAction(this.recipe);
}

class RemoveAllRecipesAction {}
