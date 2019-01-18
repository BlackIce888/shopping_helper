import 'package:flutter/material.dart';
import 'package:my_shopping_helper/src/models/models.dart';

class ItemListWidget extends StatelessWidget {
    final HomeViewModel model;

    ItemListWidget(this.model);

    @override
    Widget build(BuildContext context) {
        return ListView(
            children: model.items.map((Item item) =>
                ListTile(
                    title: Text(item.name),
                    leading: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => model.onRemoveItem(item),
                    ),
                )).toList(),
        );
    }
}