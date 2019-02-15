/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';

abstract class IRecipeRepository {
  List<Recipe>getAll();
  Recipe findById(int id);
  Future<void> save();
  Future<void> remove(int id);
}