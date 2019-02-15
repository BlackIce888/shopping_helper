/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';

class RemoveItemsButton extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return RaisedButton(
            child: Text('Delete all items'),
            onPressed: () => null,
        );
    }
}