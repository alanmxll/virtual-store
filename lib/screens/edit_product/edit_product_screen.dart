import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'components/images_fom.dart';
import 'components/sizes_form.dart';

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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    initialValue: product.name,
                    decoration: const InputDecoration(
                      hintText: "Title",
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    validator: (name) {
                      if (name.length < 6) {
                        return "Title too short.";
                      }
                      return null;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "From",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    "U\$ ...",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: product.description,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: "Description",
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    validator: (desc) {
                      if (desc.length < 10) {
                        return "Description too short.";
                      }
                      return null;
                    },
                  ),
                  SizesForm(product),
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
          ],
        ),
      ),
    );
  }
}
