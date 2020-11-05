import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_drawer/custom_drawer.dart';
import '../../models/page_manager.dart';
import '../../models/user_manager.dart';
import '../home/home_screen.dart';
import '../products/products_screen.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
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
              if (userManager.adminEnabled) ...[
                Scaffold(
                  appBar: AppBar(
                    title: const Text('Users'),
                  ),
                  drawer: CustomDrawer(),
                ),
                Scaffold(
                  appBar: AppBar(
                    title: const Text('Orders'),
                  ),
                  drawer: CustomDrawer(),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
