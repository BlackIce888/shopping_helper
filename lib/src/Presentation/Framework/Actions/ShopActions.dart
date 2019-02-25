/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';

class LoadShopListAction {}

class ShopListLoadedAction {
    final List<Shop> shopList;

    ShopListLoadedAction(this.shopList);
}

class CreateShopAction {
  final Shop shop;

  CreateShopAction(this.shop);
}

class RemoveShopAction {
  final Shop shop;

  RemoveShopAction(this.shop);
}
