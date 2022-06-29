import 'package:flutter/material.dart';

import 'ShoppingApp/screen/product.screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const ProductScreen(),
    );
  }
}
