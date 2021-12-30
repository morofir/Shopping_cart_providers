import 'package:flutter/material.dart';

import 'package:shopapp/widgets/prod_grid.dart';
import '../widgets/prod_grid.dart';

enum FilterOption { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption val) {
              setState(() {
                if (val == FilterOption.Favorites) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                  child: Text('Favorites'), value: FilterOption.Favorites),
              const PopupMenuItem(
                  child: Text('Show All'), value: FilterOption.All),
            ],
            icon: const Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),
      body: ProductsGrid(_showFavoritesOnly), //here we do the filtering!
    );
  }
}
