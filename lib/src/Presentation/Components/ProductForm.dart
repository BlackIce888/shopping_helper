/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Domain/Model/Entity/Shop.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/CreateProductViewModel.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:shopping_helper/src/Presentation/Validators/NumberValidator.dart';
import 'package:shopping_helper/src/Presentation/Validators/StringValidator.dart';

class ProductForm extends StatefulWidget {
    final CreateProductViewModel model;
    final Product product;

    ProductForm(this.model, [this.product]);

    @override
    _ProductFormState createState() {
        if (this.product != null) {
            _ProductFormState state = _ProductFormState(MoneyMaskedTextController(initialValue: this.product.price));
            state.id     = this.product.id;
            state.name   = this.product.name;
            state.shopId = this.product.shopId;
            state.price  = this.product.price;
            return state;
        }
        return _ProductFormState(MoneyMaskedTextController());
    }

}

class _ProductFormState extends State<ProductForm> {
    final _formKey = GlobalKey<FormState>();
    final MoneyMaskedTextController _controller;

    int _id;
    int _shopId;
    String _name;
    double _price;

    _ProductFormState(this._controller);

    @override
    Widget build(BuildContext context) {
        return Form(
            key: _formKey,
            child: Container(
                child: Column(
                    children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.fastfood),
                            title: TextFormField(
                                initialValue: _name,
                                decoration: InputDecoration(
                                    labelText: 'Name',
                                ),
                                validator: StringValidator.builder(
                                    rules: [
                                        StringValidatorRules.required,
                                        StringValidatorRules.length,
                                    ],
                                    options: StringValidatorOptions(
                                        minLength: 5,
                                        maxLength: 20,
                                    ),
                                ),
                                onSaved: (input) => _name = input,
                            ),
                        ),
                        ListTile(
                            leading: Icon(Icons.store_mall_directory),
                            title: DropdownButtonFormField<int>(
                                value: _shopId,
                                items: _createDropdownItems(context),
                                validator: NumberValidator.intRequired(),
                                decoration: InputDecoration(
                                    labelText: 'Shop',
                                ),
                                onChanged: (input) {
                                    _shopId = input;
                                    setState(() {
                                        _shopId = input;
                                    });
                                },
                                onSaved: (input) => _shopId = input,
                            ),
                        ),
                        ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: TextFormField(
                                controller: _controller,
                                decoration: InputDecoration(
                                    labelText: 'Price',
                                ),
                                keyboardType: TextInputType.number,
                                onSaved: (input) =>
                                    _price = _controller.numberValue,
                            ),
                        ),
                        RaisedButton(
                            onPressed: () {
                                if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    if (_id != null) {
                                        widget.model.onUpdateProduct(
                                            Product(_id, _shopId, _name, _price)
                                        );
                                    } else {
                                        widget.model.onCreateProduct(
                                            Product(null, _shopId, _name, _price)
                                        );
                                    }
                                    Navigator.of(context).pop();
                                }
                            },
                            child: Text('Submit'),
                        ),
                    ],
                ),
            ),
        );
    }

    List<DropdownMenuItem<int>> _createDropdownItems(BuildContext context) {
        List<Shop> shopList = widget.model.shopList;
        List<DropdownMenuItem<int>> dropdownItems = [];

        for (Shop shop in shopList) {
            dropdownItems.add(
                DropdownMenuItem<int>(
                    value: shop.id,
                    child: Text(shop.name),
                ),
            );
        }
        dropdownItems.add(
            DropdownMenuItem<int>(
                value: 0,
                child: FlatButton(
                    onPressed: () {
                        _openCreateShopDialog(
                            context, widget.model.onCreateShop);
                    },
                    child: Row(
                        children: <Widget>[
                            Icon(Icons.add_circle),
                            Text('Add shop'),
                        ],
                    ),
                ),
            )
        );

        return dropdownItems;
    }

    _openCreateShopDialog(BuildContext context,
        Function(Shop) onCreateShop) async {
        final _formKey = GlobalKey<FormState>();
        String _shopName;

        return await showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Add Shop'),
                    content: Form(
                        key: _formKey,
                        child: TextFormField(
                            onSaved: (input) => _shopName = input,
                            validator: StringValidator.builder(
                                rules: [
                                    StringValidatorRules.required,
                                    StringValidatorRules.length
                                ],
                                options: StringValidatorOptions(
                                    minLength: 5,
                                    maxLength: 15,
                                ),
                            ),
                        ),
                    ),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('Submit'),
                            onPressed: () {
                                if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    onCreateShop(Shop(null, _shopName));
                                    Navigator.of(context).pop();
                                }
                            }
                        ),
                    ],
                );
            }
        );
    }

    set id(int value) {
        _id = value;
    }
    set shopId(int value) {
        _shopId = value;
    }

    set name(String value) {
        _name = value;
    }

    set price(double value) {
        _price = value;
    }
}
