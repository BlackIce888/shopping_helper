/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';

class GetShopListAction {
    final List<Shop> shopList;

    GetShopListAction(this.shopList);
}

class CreateShopAction {
  final Shop shop;

  CreateShopAction(this.shop);
}

class RemoveShopAction {
  final Shop shop;

  RemoveShopAction(this.shop);
}

class RemoveAllShopsAction {}
