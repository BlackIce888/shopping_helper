import 'package:flutter/material.dart';
import 'package:my_shopping_helper/src/models/view/home.dart';

class RemoveItemsButton extends StatelessWidget {
    final HomeViewModel model;

    RemoveItemsButton(this.model);

    @override
    Widget build(BuildContext context) {
        return RaisedButton(
            child: Text('Delete all items'),
            onPressed: () => model.onRemoveItems(),
        );
    }
}