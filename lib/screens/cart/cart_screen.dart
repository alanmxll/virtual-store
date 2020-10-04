import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/price_card.dart';
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
          return ListView(
            children: [
              Column(
                children: cartManager.items
                    .map<CartTile>((cartProduct) => CartTile(cartProduct))
                    .toList(),
              ),
              PriceCard(
                buttonText: 'Continue to Delivery',
                onPressed: cartManager.isCartValid ? () {} : null,
              ),
            ],
          );
        },
      ),
    );
  }
}
