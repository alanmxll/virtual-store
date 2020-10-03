import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cart_product.dart';
import 'product.dart';
import 'user.dart';
import 'user_manager.dart';

class CartManager extends ChangeNotifier {
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

    items = cartSnap.docs
        .map((d) => CartProduct.fromDocument(d)..addListener(_onItemUpdated))
        .toList();
  }

  void addToCart(Product product) {
    try {
      final entity = items.firstWhere((p) => p.stackable(product));
      entity.increment();
    } catch (e) {
      final cartProduct = CartProduct.fromProduct(product);
      cartProduct.addListener(_onItemUpdated);
      items.add(cartProduct);
      user.cartReference
          .add(cartProduct.toCartItemMap())
          .then((doc) => cartProduct.id = doc.id);
    }
  }

  void removeFromCart(CartProduct cartProduct) {
    items.removeWhere((p) => p.id == cartProduct.id);
    user.cartReference.doc(cartProduct.id).delete();
    cartProduct.removeListener(_onItemUpdated);
    notifyListeners();
  }

  void _onItemUpdated() {
    for (final cartProduct in items) {
      if (cartProduct.quantity == 0) {
        removeFromCart(cartProduct);
      }
      _updateCartProduct(cartProduct);
    }
  }

  void _updateCartProduct(CartProduct cartProduct) {
    user.cartReference.doc(cartProduct.id).update(cartProduct.toCartItemMap());
  }
}
