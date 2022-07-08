import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/product_provider.dart';
import 'package:practice_app/ShoppingApp/screen/edit_product.screen.dart';
import 'package:practice_app/ShoppingApp/widgets/drawer.widget.dart';
import 'package:practice_app/ShoppingApp/widgets/user_product_item.widget.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);
  static const routeName = '/user_product';

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Your product'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const DrawerWidget(),
      body: ListView.builder(
        itemCount: prod.items.length,
        itemBuilder: (_, i) => Column(
          children: [
            UserProductItemWidget(
              title: prod.items[i].title,
              imageUrl: prod.items[i].imageUrl,
              id: prod.items[i].id!,
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
