import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_manager.dart';

class PriceCard extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const PriceCard({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final cartManager = context.watch<CartManager>();
    final productsPrice = cartManager.productsPrice;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Order Summary',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal'),
                Text('R\$ ${productsPrice.toStringAsFixed(2)}'),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'R\$ ${productsPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Theme.of(context).primaryColor.withAlpha(100);
                    }
                    return null;
                  },
                ),
              ),
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
