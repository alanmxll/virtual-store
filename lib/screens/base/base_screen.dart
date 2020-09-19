import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_drawer/custom_drawer.dart';
import '../../models/page_manager.dart';
import '../products/products_screen.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            drawer: CustomDrawer(),
          ),
          ProductsScreen(),
          Scaffold(
            appBar: AppBar(
              title: const Text('My Orders'),
            ),
            drawer: CustomDrawer(),
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Stores'),
            ),
            drawer: CustomDrawer(),
          ),
        ],
      ),
    );
  }
}
