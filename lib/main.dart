import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/prod_detail.dart';
import './providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //provider cleans old data automatically
    return ChangeNotifierProvider(
      //optional value without context, then value:...
      create: (ctx) => Products(), //instance of a product provider
      //the listeners will build the app of something changes
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
              fontFamily: 'Lato',
              primarySwatch: Colors.cyan,
              secondaryHeaderColor: Colors.teal),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetails.routeName: (ctx) => ProductDetails(),
          }),
    );
  }
}
