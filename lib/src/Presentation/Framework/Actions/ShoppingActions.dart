import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';

class LoadShoppingListAction {}

class ShoppingListLoadedAction {
    final Map<Product, int> shoppingList;

    ShoppingListLoadedAction(this.shoppingList);
}

class AddToShoppingListAction {
  final Product product;

  AddToShoppingListAction(this.product);
}

class UpdateShoppingListAction {
  final Product product;

  UpdateShoppingListAction(this.product);
}

class RemoveFromShoppingListAction {
  final Product product;

  RemoveFromShoppingListAction(this.product);
}

class ClearShoppingListAction {}
