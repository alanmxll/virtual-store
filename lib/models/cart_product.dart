import 'item_size.dart';
import 'product.dart';

class CartProduct {
  String productId;
  String size;
  int quantity;

  Product product;

  ItemSize get itemSize {
    if (product == null) {
      return null;
    } else {
      return product.findSize(size);
    }
  }

  num get unitPrice {
    if (product == null) {
      return 0;
    } else {
      return itemSize?.price ?? 0;
    }
  }

  CartProduct.fromProduct(this.product) {
    productId = product.id;
    quantity = 1;
    size = product.selectedSize.name;
  }
}
