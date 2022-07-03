import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/cart.provider.dart';
import 'package:practice_app/ShoppingApp/Logic/order.provider.dart';
import 'package:practice_app/ShoppingApp/screen/cart.screen.dart';
import 'package:practice_app/ShoppingApp/screen/orders.screen.dart';
import 'package:practice_app/ShoppingApp/screen/product.screen.dart';
import 'package:provider/provider.dart';

import 'ShoppingApp/Logic/product_provider.dart';
import 'ShoppingApp/screen/product_details.screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primaryColor: Colors.purple,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange),
        ),
        debugShowCheckedModeBanner: false,
        home: const ProductScreen(),
        routes: {
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrderScreen.routeName: (context) => const OrderScreen()
        },
      ),
    );
  }
}
