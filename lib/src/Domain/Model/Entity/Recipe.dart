/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Exception/ArgumentException.dart';
import 'package:shopping_helper/src/Domain/Model/ValueObject/ProductAmount.dart';

class Recipe {
    int _id;
    String _name;
    int _prepTime;
    int _cookTime;
    List<ProductAmount> _ingredients;
    String _instructions;

    Recipe(int id, String name, int prepTime, int cookTime, List<ProductAmount> ingredients, String instructions) {
      id == null ? throw ArgumentException : this._id = id;
      name == null ? throw ArgumentException : this._name = name;
      prepTime == null ? throw ArgumentException : this._prepTime = prepTime;
      cookTime == null ? throw ArgumentException : this._cookTime = cookTime;
      ingredients == null ? throw ArgumentException : this._ingredients = ingredients;
      instructions == null ? throw ArgumentException : this._instructions = instructions;
    }

    int get id => _id;

    String get name => _name;

    int get prepTime => _prepTime;

    int get cookTime => _cookTime;

    List<ProductAmount> get ingredients => _ingredients;

    String get instructions => _instructions;
}