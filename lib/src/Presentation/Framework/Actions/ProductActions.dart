import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';

class GetProductListAction {
    final List<Product> productList;

    GetProductListAction(this.productList);
}

class CreateProductAction {
  final Product product;

  CreateProductAction(this.product);
}

class RemoveProductAction {
  final Product product;

  RemoveProductAction(this.product);
}

class RemoveAllProductsAction {}
