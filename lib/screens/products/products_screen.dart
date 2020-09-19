import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_drawer/custom_drawer.dart';
import '../../models/product_manager.dart';
import 'components/product_list_tile.dart';
import 'components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final search = await showDialog<String>(
                context: context,
                builder: (_) {
                  return SearchDialog();
                },
              );

              if (search != null) {
                context.read<ProductManager>().search = search;
              }
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filtredProducts = productManager.filtredProducts;
          return ListView.builder(
            padding: const EdgeInsets.all(4.0),
            itemCount: filtredProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(
                product: filtredProducts[index],
              );
            },
          );
        },
      ),
    );
  }
}
