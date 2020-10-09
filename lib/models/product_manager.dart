import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'product.dart';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    _loadAllProducts();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Product> allProducts = [];

  String _search = '';
  String get search => _search;
  set search(String value) {
    _search = value;

    notifyListeners();
  }

  List<Product> get filtredProducts {
    final List<Product> filtredProducts = [];

    if (search.isEmpty) {
      filtredProducts.addAll(allProducts);
    } else {
      filtredProducts.addAll(
        allProducts.where((product) {
          return product.name.toLowerCase().contains(search.toLowerCase());
        }),
      );
    }

    return filtredProducts;
  }

  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapProducts =
        await firestore.collection('products').get();

    allProducts = snapProducts.docs
        .map<Product>((document) => Product.fromDocument(document))
        .toList();

    notifyListeners();
  }

  Product findProductById(String id) {
    try {
      return allProducts.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
