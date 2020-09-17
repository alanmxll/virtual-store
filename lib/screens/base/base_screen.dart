import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store/screens/login/login_screen.dart';

import '../../common/custom_drawer/custom_drawer.dart';
import '../../models/page_manager.dart';

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
          LoginScreen(),
          // Scaffold(
          //   appBar: AppBar(
          //     title: const Text('Home'),
          //   ),
          //   drawer: CustomDrawer(),
          // ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
            ),
            drawer: CustomDrawer(),
          ),
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
