import 'product.dart';

class CartProduct {
  String productId;
  String size;
  int quantity;

  Product product;

  CartProduct.fromProduct(this.product) {
    productId = product.id;
    quantity = 1;
    size = product.selectedSize.name;
  }
}
