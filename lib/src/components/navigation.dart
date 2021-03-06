import 'package:flutter/material.dart';

class MainNavigation extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                children: <Widget>[
                    DrawerHeader(
                        child: Text('myLittleShoppingHelper'),
                    ),
                    ListTile(
                        leading: Icon(Icons.format_list_numbered),
                        title: Text('Shopping List'),
                        onTap: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                        },
                    ),
                    ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Products'),
                        onTap: () {
                            Navigator.of(context).pushReplacementNamed('/products');
                        },
                    ),
                    ListTile(
                        leading: Icon(Icons.library_books),
                        title: Text('Recipes'),
                        onTap: () {
                            Navigator.of(context).pushReplacementNamed('/recipes');
                        },
                    ),
                ],
            ),
        );
    }
}
