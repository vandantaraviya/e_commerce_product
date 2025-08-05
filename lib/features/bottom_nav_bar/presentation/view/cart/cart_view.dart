import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_product/features/bottom_nav_bar/presentation/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Cart')),
          body: provider.cart.isEmpty
              ? Center(child: Text('Your cart is empty'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: provider.cart.entries.map((entry) {
                          final product = provider.products.firstWhere(
                            (p) => p.id == entry.key,
                          );
                          final qty = entry.value;
                          return ListTile(
                            leading: SizedBox(
                              height: 40,
                              child: CachedNetworkImage(
                                imageUrl: product.image ?? "",
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                      child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    Center(child: Icon(Icons.error)),
                              ),
                            ),

                            title: Text(product.title ?? "-"),
                            subtitle: Text(
                              'Qty: $qty x ₹${(product.price ?? 0.0).toStringAsFixed(2)}',
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () =>
                                      provider.removeFromCart(product.id),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () =>
                                      provider.addToCart(product.id),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Total : ₹${provider.totalCartValue.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
