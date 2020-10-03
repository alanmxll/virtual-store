import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_manager.dart';
import 'components/cart_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __) {
          return Column(
            children: cartManager.items
                .map<CartTile>((cartProduct) => CartTile(cartProduct))
                .toList(),
          );
        },
      ),
    );
  }
}
