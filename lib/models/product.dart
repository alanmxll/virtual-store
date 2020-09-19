import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'item_size.dart';

class Product extends ChangeNotifier {
  String id;
  String name;
  String description;
  List<String> images;
  List<ItemSize> sizes;

  ItemSize _selectedSize;
  ItemSize get selectedSize => _selectedSize;
  set selectedSize(ItemSize value) {
    _selectedSize = value;

    notifyListeners();
  }

  int get totalStock {
    int stock = 0;

    for (final size in sizes) {
      stock += size.stock;
    }

    return stock;
  }

  bool get hasStock => totalStock > 0;

  Product.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    description = document.data()['description'] as String;
    images = List<String>.from(document.data()['images'] as List<dynamic>);
    sizes = (document.data()['sizes'] as List<dynamic> ?? []).map((size) {
      return ItemSize.fromMap(size as Map<String, dynamic>);
    }).toList();
  }
}
