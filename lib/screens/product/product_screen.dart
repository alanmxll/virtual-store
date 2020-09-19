import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({this.product});

  @override
  Widget build(BuildContext context) {
    final Color _primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Carousel(
              images: product.images.map<NetworkImage>((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: _primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'From',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Text(
                  'U\$ 19.99',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: _primaryColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
