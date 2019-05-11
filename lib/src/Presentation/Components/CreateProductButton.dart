/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';

class CreateProductButton extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return FloatingActionButton(
            tooltip: 'Add an Item',
            child: Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed('/createProduct'),
        );
    }
}
