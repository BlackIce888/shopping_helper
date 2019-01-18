import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class CreateItemForm extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Form(
            child: Expanded(
                child: ListView(
                    children: <Widget>[
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Name',
                            ),
                            validator: (value) {
                                if (value.isEmpty) {
                                    return 'Please enter some text';
                                }
                            },
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Shop',
                            ),
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Price',
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false,
                                decimal: false
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