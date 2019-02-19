/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/CreateProductViewModel.dart';

class CreateProductForm extends StatelessWidget {
    final CreateProductViewModel model;

    CreateProductForm(this.model);

    @override
    Widget build(BuildContext context) {
        print('DropdownList');
        print(model.dropdownList);
        return Form(
            child: Container(
                child: Column(
                    children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.fastfood),
                            title: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Name',
                                ),
                                validator: (value) {
                                    if (value.isEmpty) {
                                        return 'Please enter some text';
                                    }
                                },
                            ),
                        ),
                        ListTile(
                            leading: Icon(Icons.store_mall_directory),
                            title: DropdownButtonFormField(
                                items: model.dropdownList,
                                decoration: InputDecoration(
                                    labelText: 'Shop',
                                ),
                                onChanged: (val) {
                                    print(val);
                                },
                            ),
                        ),
                        ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Price',
                                ),
                                keyboardType: TextInputType.number,
                            ),
                        ),


                        RaisedButton(
                            onPressed: null, /* () {
                                    if (_formKey.currentState.validate()) {
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text('Processing Data')));
                                    }
                                }, */
                            child: Text('Submit'),
                        ),
                    ],
                ),
            ),
        );
    }
}
