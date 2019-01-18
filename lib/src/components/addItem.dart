import 'package:flutter/material.dart';

class CreateProductButton extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return FloatingActionButton(
            tooltip: 'add an Item',
            child: Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed('/products/createItem'),
        );
    }
}