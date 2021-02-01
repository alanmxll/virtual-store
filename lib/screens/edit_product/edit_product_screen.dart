import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'components/images_fom.dart';

class EditProductScreen extends StatelessWidget {
  final Product product;

  const EditProductScreen({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Advertisement'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ImagesForm(product),
        ],
      ),
    );
  }
}
