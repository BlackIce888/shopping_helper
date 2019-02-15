/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:money/money.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';

class ItemListWidget extends StatelessWidget {
  final Future<List<Product>> list;

  ItemListWidget(this.list);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: list,
      builder: (context, snapshot) {
        print(snapshot);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List listItemInfo = snapshot.data;
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listItemInfo[index].name),
                    leading: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => null,
                    ),
                    trailing: Text(
                        Money(listItemInfo[index].price, Currency('EUR'))
                            .toString()),
                  );
                },
              );
            }
        }
      },
    );
  }
}
