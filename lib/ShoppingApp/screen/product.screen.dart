import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/constants/list_product.dart';
import 'package:practice_app/ShoppingApp/widgets/product_item.widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = loadedProduct;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productData.length,
        itemBuilder: (ctx, i) => ProduuctItemWidget(
          id: productData[1].id,
          title: productData[i].title,
          imageUrl: productData[i].imageUrl,
        ),
      ),
    );
  }
}
