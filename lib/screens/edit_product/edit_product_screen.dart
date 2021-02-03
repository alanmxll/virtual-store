import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'components/images_fom.dart';

class EditProductScreen extends StatelessWidget {
  final Product product;

  EditProductScreen({this.product});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Advertisement'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            ImagesForm(product),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  // TODO
                }
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
