import 'package:flutter/foundation.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';

class AppState {
  final List<Product> productList;

  AppState({@required this.productList});

  AppState.initialState() : productList = List.unmodifiable(<Product>[]);
}
