import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ImagesForm extends StatelessWidget {
  final Product product;

  const ImagesForm(this.product);

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
      initialValue: product.images,
      builder: (state) {
        return AspectRatio(
          aspectRatio: 1.0,
          child: Carousel(
            images: state.value.map((image) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  if (image is String)
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                    )
                  else
                    Image.file(
                      image as File,
                      fit: BoxFit.cover,
                    ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      color: Colors.red,
                      onPressed: () {
                        state.value.remove(image);
                        state.didChange(state.value);
                      },
                    ),
                  )
                ],
              );
            }).toList(),
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotBgColor: Colors.transparent,
            dotColor: Theme.of(context).primaryColor,
            autoplay: false,
          ),
        );
      },
    );
  }
}
