import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_size.dart';

class Product {
  String id;
  String name;
  String description;
  List<String> images;
  List<ItemSize> sizes;

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
