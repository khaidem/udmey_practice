import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/screen/orders.screen.dart';
import 'package:practice_app/ShoppingApp/screen/user_product.screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello Friends'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Order'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit user-product'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
