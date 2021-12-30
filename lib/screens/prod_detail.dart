import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products_provider.dart';

class ProductDetails extends StatelessWidget {
  // final String title;

  // ProductDetails(this.title);
  static const routeName = '/prod-detail';

  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context)?.settings.arguments as String;

    //minimum logic in the widget! all logic in the store(provider)!
    final loadedProduct =
        Provider.of<Products>(context, listen: false).getLoadedByid(prodId);
    //i dont want to listen if im in statless widgets, nothing will change here
    //i just want to get item one time
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Text(loadedProduct.description),
    );
  }
}
