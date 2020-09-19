import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store/screens/products/components/product_list_tile.dart';

import '../../common/custom_drawer/custom_drawer.dart';
import '../../models/product_manager.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          return ListView.builder(
            padding: const EdgeInsets.all(4.0),
            itemCount: productManager.allProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(
                product: productManager.allProducts[index],
              );
            },
          );
        },
      ),
    );
  }
}
