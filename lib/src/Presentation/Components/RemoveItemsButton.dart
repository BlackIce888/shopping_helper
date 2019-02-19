/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/ProductViewModel.dart';

class RemoveItemsButton extends StatelessWidget {
    final ProductViewModel model;

    RemoveItemsButton(this.model);

    @override
    Widget build(BuildContext context) {
        return RaisedButton(
            child: Text('Delete all items'),
            onPressed: () => model.onRemoveAllProducts(),
        );
    }
}