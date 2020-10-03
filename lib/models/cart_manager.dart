import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_product.dart';
import 'product.dart';
import 'user.dart';
import 'user_manager.dart';

class CartManager {
  List<CartProduct> items = [];

  User user;

  void updateUser(UserManager userManager) {
    user = userManager.user;
    items.clear();

    if (user != null) {
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async {
    final QuerySnapshot cartSnap = await user.cartReference.get();

    items = cartSnap.docs.map((d) => CartProduct.fromDocument(d)).toList();
  }

  void addToCart(Product product) {
    try {
      final entity = items.firstWhere((p) => p.stackable(product));
      entity.quantity++;
    } catch (e) {
      final cartProduct = CartProduct.fromProduct(product);
      items.add(cartProduct);
      user.cartReference.add(cartProduct.toCartItemMap());
    }
  }
}
