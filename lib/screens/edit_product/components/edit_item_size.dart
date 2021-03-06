import 'package:flutter/material.dart';
import 'package:virtual_store/models/item_size.dart';

class EditItemSize extends StatelessWidget {
  final ItemSize size;

  const EditItemSize({this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: size.name,
            decoration: const InputDecoration(
              labelText: 'Title',
              isDense: true,
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: TextFormField(
            initialValue: size.stock.toString(),
            decoration: const InputDecoration(
              labelText: 'Stock',
              isDense: true,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: TextFormField(
            initialValue: size.price.toStringAsFixed(2),
            decoration: const InputDecoration(
              labelText: 'Price',
              isDense: true,
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ),
      ],
    );
  }
}
