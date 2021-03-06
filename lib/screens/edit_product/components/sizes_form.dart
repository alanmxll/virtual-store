import 'package:flutter/material.dart';
import 'package:virtual_store/common/custom_icon_button.dart';
import 'package:virtual_store/models/item_size.dart';
import 'package:virtual_store/models/product.dart';

import 'edit_item_size.dart';

class SizesForm extends StatelessWidget {
  final Product product;

  const SizesForm(this.product);

  @override
  Widget build(BuildContext context) {
    return FormField<List<ItemSize>>(
      initialValue: List.from(product.sizes),
      builder: (state) {
        return Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Sizes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomIconButton(
                  iconData: Icons.add,
                  color: Colors.black,
                  onTap: () {
                    state.value.add(ItemSize());
                    state.didChange(state.value);
                  },
                )
              ],
            ),
            Column(
              children: state.value.map((size) {
                return EditItemSize(
                  size: size,
                  onRemove: () {
                    state.value.remove(size);
                    state.didChange(state.value);
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
