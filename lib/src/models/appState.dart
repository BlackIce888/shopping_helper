import 'package:flutter/foundation.dart';
import 'package:my_shopping_helper/src/models/item.dart';

class AppState {
    final List<Item> items;

    AppState({
        @required this.items
    });

    AppState.initialState() : items = List.unmodifiable(<Item>[]);
}