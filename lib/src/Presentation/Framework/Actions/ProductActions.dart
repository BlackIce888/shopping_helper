import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';

class LoadProductListAction {}

class ProductListLoadedAction {
    final List<Product> productList;

    ProductListLoadedAction(this.productList);
}

class CreateProductAction {
  final Product product;

  CreateProductAction(this.product);
}

class UpdateProductAction {
  final Product product;

  UpdateProductAction(this.product);
}

class RemoveProductAction {
  final Product product;

  RemoveProductAction(this.product);
}

class RemoveAllProductsAction {}
