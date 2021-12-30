import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/screens/prod_detail.dart';
import '../screens/prod_detail.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // ProductItem(this.id, this.title, this.imageUrl); using provider insted

  @override
  Widget build(BuildContext context) {
    final singleProduct = Provider.of<Product>(context, listen: true);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetails.routeName,
                  arguments: singleProduct.id);
              // Navigator.of(context).push(
              //     //navigate of the fly(not good for big apps)
              //     MaterialPageRoute(builder: (ctx) => ProductDetails(title)));
            },
            child: Image.network(singleProduct.imageUrl, fit: BoxFit.cover)),
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              icon: Icon(
                singleProduct.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              color: Colors.redAccent,
              onPressed: () {
                singleProduct.toggleFavouriteStatus();
              },
              iconSize: 20,
            ),
            title: Text(
              singleProduct.title,
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
            trailing: const IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
              iconSize: 20,
              onPressed: null,
            )),
      ),
    );
  }
}
