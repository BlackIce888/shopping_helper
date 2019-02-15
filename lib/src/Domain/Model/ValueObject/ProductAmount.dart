/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Exception/ArgumentException.dart';

class ProductAmount {
  int _productId;
  int _amount;
  int _measurementUnit;

  ProductAmount(productId, amount, measurementUnit) {
    productId == null ? throw ArgumentException : this._productId = productId;
    amount == null ? throw ArgumentException : this._amount = amount;
    measurementUnit == null ? throw ArgumentException : this._measurementUnit = measurementUnit;
  }

  get productId => _productId;

  get amount => _amount;

  get measurementUnit => _measurementUnit;
}

enum Units {kg, g, mg, l, ml, tsp, tbsp, piece, cup, handful, single, undefined}
