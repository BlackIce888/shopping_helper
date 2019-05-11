/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

import 'package:flutter/material.dart';
import 'package:shopping_helper/src/Presentation/Pages/ProductPage.dart';
import 'package:shopping_helper/src/Presentation/Pages/ShoppingPage.dart';

class PageContainer extends StatelessWidget {
    static final PageController controller = PageController(
        initialPage: 1,
    );

    @override
    Widget build(BuildContext context) {
        return PageView(
            controller: controller,
            children: <Widget>[
                ShoppingPage(),
                ProductPage(),
            ],
        );
    }
}
