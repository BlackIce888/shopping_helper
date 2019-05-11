/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Recipe.dart';
import 'package:shopping_helper/src/Domain/Repository/IRecipeRepository.dart';
import 'package:shopping_helper/src/Infrastructure/Service/IDatabaseService.dart';

class RecipeRepository implements IRecipeRepository {
    final IDatabaseService _databaseService;

    RecipeRepository(this._databaseService);

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
    Future update(Recipe recipe) async {
        bool result = await _databaseService.update(recipe.toJson());
        if (!result) {
            throw Exception;
        }
    }

    @override
    Future insert(Recipe recipe) async {
        bool result = await _databaseService.insert(recipe.toJson());
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

    @override
    Future removeAll() async {
        bool result = await _databaseService.removeAll();
        if (!result) {
            throw Exception;
        }
    }
}
