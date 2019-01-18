import 'package:my_shopping_helper/src/models/item.dart';

class CreateItemAction {
    final Item item;

    CreateItemAction(this.item);
}

class RemoveItemAction {
    final Item item;

    RemoveItemAction(this.item);
}

class RemoveItemsAction {}