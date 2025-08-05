import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_product/features/bottom_nav_bar/presentation/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final products = provider.products;

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : provider.isLoading == false && provider.products.isEmpty
          ? Center(child: Text('No Products'))
          : SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  final isFav = provider.favorites.contains(product.id);
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
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
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            product.title ?? "-",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '₹${(product.price ?? 0.0).toDouble().toStringAsFixed(2)}',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                              ),
                              onPressed: () =>
                                  provider.toggleFavorite(product.id),
                            ),
                            ElevatedButton(
                              child: Text("Add"),
                              onPressed: () => provider.addToCart(product.id),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
