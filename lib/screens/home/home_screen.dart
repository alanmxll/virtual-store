import 'package:flutter/material.dart';
import 'package:virtual_store/common/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromARGB(255, 211, 118, 130),
                  Color.fromARGB(255, 253, 181, 168)
                ],
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text(
                    'Flutter Store',
                  ),
                  centerTitle: true,
                ),
                snap: true,
                floating: true,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => Navigator.pushNamed(context, '/cart'),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 2000.0,
                  width: 200.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
