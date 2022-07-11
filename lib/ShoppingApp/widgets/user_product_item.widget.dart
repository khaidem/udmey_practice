import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/product_provider.dart';
import 'package:practice_app/ShoppingApp/screen/edit_product.screen.dart';
import 'package:provider/provider.dart';

class UserProductItemWidget extends StatelessWidget {
  const UserProductItemWidget(
      {Key? key, required this.title, required this.imageUrl, required this.id})
      : super(key: key);
  final String title;
  final String imageUrl;
  final String id;

  @override
  Widget build(BuildContext context) {
    //** Go to/use in user_Product.Screen.dart */
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
//** don't use fit in NetworkImage because it not a widget,it is and object that does fetching
//* of the image and then  forward it to circleAvatar  */
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      title: Text(title),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
                log('edit bottom');
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () async {
                try {
                  Provider.of<ProductsProvider>(context, listen: false)
                      .deleteProduct(id);
                  log('delete bottom');
                } catch (error) {
                  scaffold.showSnackBar(
                    const SnackBar(
                      content: Text('Deleting  failed'),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
