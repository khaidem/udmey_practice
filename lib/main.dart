import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/screen/product_details.screen.dart';
import 'package:provider/provider.dart';

import 'ShoppingApp/Logic/product_provider.dart';
import 'ShoppingApp/screen/product.screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            primaryColor: Colors.purple,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Colors.deepOrange)),
        home: const ProductScreen(),
        routes: {
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen()
        },
      ),
    );
  }
}
