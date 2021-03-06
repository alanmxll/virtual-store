import 'package:flutter/material.dart';
import 'package:virtual_store/common/custom_icon_button.dart';
import 'package:virtual_store/models/item_size.dart';

class EditItemSize extends StatelessWidget {
  final ItemSize size;
  final VoidCallback onRemove;

  const EditItemSize({this.size, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 30,
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
          flex: 30,
          child: TextFormField(
            initialValue: size.stock?.toString(),
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
          flex: 40,
          child: TextFormField(
            initialValue: size.price?.toStringAsFixed(2),
            decoration: const InputDecoration(
              labelText: 'Price',
              isDense: true,
              prefixText: 'U\$',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ),
        CustomIconButton(
          iconData: Icons.remove,
          color: Colors.red,
          onTap: onRemove,
        ),
        const CustomIconButton(
          iconData: Icons.arrow_drop_up,
          color: Colors.black,
        ),
        const CustomIconButton(
          iconData: Icons.arrow_drop_down,
          color: Colors.black,
        ),
      ],
    );
  }
}
