import 'package:flutter/material.dart';

import '../../../models/cart_product.dart';

class CartTile extends StatelessWidget {
  final CartProduct cartProduct;

  const CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80.0,
              width: 80.0,
              child: Image.network(
                cartProduct.product.images.first,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  children: [
                    Text(
                      cartProduct.product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Size: ${cartProduct.size}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
