/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
    final String title;
    final String msg;
    final Function() onRemoveAllFunction;

    RemoveButton(this.title, this.msg, this.onRemoveAllFunction);

    @override
    Widget build(BuildContext context) {
        return RaisedButton(
            child: Text(title),
            onPressed: () {
                _openConfirmationDialog(context, onRemoveAllFunction);
            },
        );
    }
    _openConfirmationDialog(BuildContext context, Function() onRemoveAll) async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(title),
                    content: Text(msg),
                    actions: <Widget>[
                        Row(
                            children: <Widget>[
                                FlatButton(
                                    child: Text('Abort'),
                                    onPressed: () {
                                        Navigator.of(context).pop();
                                    }
                                ),
                                FlatButton(
                                    child: Text('Proceed'),
                                    onPressed: () {
                                        onRemoveAll();
                                        Navigator.of(context).pop();
                                    }
                                ),
                            ],
                        ),
                    ],
                );
            }
        );
    }
}
