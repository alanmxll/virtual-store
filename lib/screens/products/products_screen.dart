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
        title: Consumer<ProductManager>(
          builder: (_, productManager, __) {
            if (productManager.search.isEmpty) {
              return const Text('Products');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                        context: context,
                        builder: (_) {
                          return SearchDialog(
                            initialText: productManager.search,
                          );
                        },
                      );

                      if (search != null) {
                        productManager.search = search;
                      }
                    },
                    child: SizedBox(
                      width: constraints.biggest.width,
                      child: Text(
                        productManager.search,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        centerTitle: true,
        actions: [
          Consumer<ProductManager>(
            builder: (_, productManager, __) {
              if (productManager.search.isEmpty) {
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                      context: context,
                      builder: (_) {
                        return SearchDialog(
                          initialText: productManager.search,
                        );
                      },
                    );

                    if (search != null) {
                      productManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    productManager.search = '';
                  },
                );
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
