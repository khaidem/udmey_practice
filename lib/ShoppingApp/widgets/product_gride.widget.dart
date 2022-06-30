import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/widgets/product_item.widget.dart';
import 'package:provider/provider.dart';

import '../Logic/product_provider.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final product = productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(child: ProduuctItemWidget(
        id: product[1].id,
        title: product[i].title,
        imageUrl: product[i].imageUrl,
      ),,) 
    );
  }
}
