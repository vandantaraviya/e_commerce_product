import 'package:e_commerce_product/features/bottom_nav_bar/presentation/provider/bottom_nav_bar_provider.dart';
import 'package:e_commerce_product/features/bottom_nav_bar/presentation/view/cart/cart_view.dart';
import 'package:e_commerce_product/features/bottom_nav_bar/presentation/view/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Widget> _pages = [ProductGridPage(), CartPage()];
  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavBarProvider>(context);

    return Scaffold(
      body: _pages[navProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.currentIndex,
        selectedItemColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Products'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        onTap: (index) => navProvider.updateIndex(index),
      ),
    );
  }
}
