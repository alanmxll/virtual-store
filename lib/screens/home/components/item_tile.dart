import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../models/product_manager.dart';
import '../../../models/section_item.dart';

class ItemTile extends StatelessWidget {
  final SectionItem item;

  const ItemTile(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.product != null) {
          final product =
              context.read<ProductManager>().findProductById(item.product);

          if (product != null) {
            Navigator.pushNamed(context, '/product', arguments: product);
          }
        }
      },
      child: AspectRatio(
        aspectRatio: 1.0,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: item.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
