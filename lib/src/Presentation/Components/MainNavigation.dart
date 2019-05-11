/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:shopping_helper/src/Presentation/Pages/PageContainer.dart';

class MainNavigation extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                children: <Widget>[
                    DrawerHeader(
                        child: Text('ShoppingHelper'),
                    ),
                    ListTile(
                        leading: Icon(Icons.format_list_numbered),
                        title: Text('Shopping List'),
                        onTap: () {
                            PageContainer.controller.jumpToPage(0);
                        },
                    ),
                    ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Products'),
                        onTap: () {
                            PageContainer.controller.jumpToPage(1);
                        },
                    ),
                    ListTile(
                        leading: Icon(Icons.library_books),
                        title: Text('Recipes'),
                        onTap: () {
                            PageContainer.controller.jumpToPage(0);
                        },
                    ),
                ],
            ),
        );
    }
}
