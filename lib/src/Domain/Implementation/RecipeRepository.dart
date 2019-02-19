/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';
import 'package:shopping_helper/src/Domain/Repository/IRecipeRepository.dart';
import 'package:shopping_helper/src/Infrastructure/Implementation/SQLiteDatabaseService.dart';

class RecipeRepository implements IRecipeRepository {
    static final RecipeRepository instance = RecipeRepository._();
    static final String _tableName = 'recipe';
    final SQLiteDatabaseService _databaseService = SQLiteDatabaseService(_tableName);

    RecipeRepository._();

    @override
    Future<Recipe> getById(int id) async {
        List<Map<String, dynamic>> dataset = await _databaseService.findById(id);
        if (dataset.length != 1) {
            throw Exception;
        }
        return Recipe.fromJson(dataset.first);
    }

    @override
    Future<List<Recipe>> getAll() async{
        List<Map<String, dynamic>> dataset = await _databaseService.findAll();
        List<Recipe> result = [];
        for (Map<String, dynamic> data in dataset) {
            if (data.isNotEmpty) {
                result.add(Recipe.fromJson(data));

            }
        }
        return result;
    }

    @override
    Future save(Recipe recipe) async {
        bool result = await _databaseService.save(recipe.toJson());
        if (!result) {
            throw Exception;
        }
    }

    @override
    Future remove(int id) async {
        bool result = await _databaseService.remove(id);
        if (!result) {
            throw Exception;
        }
    }
}
