import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:shopapp/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoritesOnly;
  ProductsGrid(this.showFavoritesOnly);

  @override
  Widget build(BuildContext context) {
    //here listen: true, is a must, because the data is changing
    final loadProductsData = Provider.of<Products>(context);
    final loadProducts = showFavoritesOnly
        ? loadProductsData.getFavoritesItems
        : loadProductsData.getItems;
    //direct communication to store.
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              // value: (ctx) => loadProducts[index], //single product
              value: loadProducts[
                  index], //optional without context as object (immutable)
              child: ProductItem(),
            ));
  }
}
