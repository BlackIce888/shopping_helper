/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Exception/ArgumentException.dart';

class Shop {
    int _id;
    String _name;

    Shop(id, name) {
        _id == null ? throw ArgumentException : this._id = id;
        _name == null ? throw ArgumentException : this._name = name;
    }

    get id => _id;

    get name => _name;
}