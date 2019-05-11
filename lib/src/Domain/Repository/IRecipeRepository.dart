/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';

abstract class IRecipeRepository {
    Future<List<Recipe>> getAll();

    Future<Recipe> getById(int id);

    Future update(Recipe recipe);

    Future insert(Recipe recipe);

    Future remove(int id);

    Future removeAll();
}
